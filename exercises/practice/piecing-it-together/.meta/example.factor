USING: arrays assocs combinators kernel locals math math.functions
math.order sequences ;
IN: piecing-it-together

<PRIVATE

: ratio>format ( ratio -- format )
    {
        { [ dup 1.0 < ] [ drop "portrait" ] }
        { [ dup 1.0 = ] [ drop "square" ] }
        [ drop "landscape" ]
    } cond ;

! Format implied by a rows/columns pair.
:: pair-format ( rows columns -- format )
    columns rows /f ratio>format ;

! Integer roots of x^2 - sum*x + product = 0, as a possibly empty
! sequence of { rows columns } pairs ({ larger smaller } and its swap).
:: sum-product>pairs ( sum product -- pairs )
    sum sq product 4 * - :> disc
    disc 0 >= [
        disc sqrt :> root
        sum root - 2 /f :> a
        sum root + 2 /f :> b
        a b [ >integer ] bi@ :> ( ai bi )
        ai dup >integer = bi dup >integer = and
        ai bi + sum = and [
            { { ai bi } { bi ai } }
        ] [ { } ] if
    ] [ { } ] if ;

! Solve (rows-2)*(columns-2) = inside with columns = ratio * rows.
! ratio*r^2 - 2(1+ratio)*r + (4 - inside) = 0
:: inside-ratio>pair ( inside ratio -- pair/f )
    ratio :> a
    -2 1 ratio + * :> b
    4 inside - :> c
    b sq 4 a c * * - :> disc
    disc 0 >= [
        disc sqrt :> root
        b neg root + 2 a * /f round >integer :> r
        r ratio * round >integer :> c2
        r 2 >= c2 2 >= and
        r 2 - c2 2 - * inside = and
        [ r c2 2array ] [ f ] if
    ] [ f ] if ;

! --- gathering candidate { rows columns } pairs ---

: g ( partial key -- value/f ) swap at ;

! pieces & inside, or pieces & border, or inside & border:
! determine product (pieces) and inside, then sum = rows+columns.
:: pieces&inside>pairs ( pieces inside -- pairs )
    pieces inside - 4 + 2 /f >integer :> sum
    sum pieces sum-product>pairs ;

:: counts>pairs ( partial -- pairs )
    partial "pieces" g :> pieces
    partial "inside" g :> inside
    partial "border" g :> border
    {
        { [ pieces inside and ] [ pieces inside pieces&inside>pairs ] }
        { [ pieces border and ]
          [ pieces pieces border - pieces&inside>pairs ] }
        { [ inside border and ]
          [ inside border + inside pieces&inside>pairs ] }
        [ { } ]
    } cond ;

:: ratio>candidate ( partial ratio -- pair/f )
    partial "rows" g :> rows
    partial "columns" g :> columns
    partial "pieces" g :> pieces
    partial "inside" g :> inside
    {
        { [ rows ] [ rows rows ratio * round >integer 2array ] }
        { [ columns ]
          [ columns ratio / round >integer columns 2array ] }
        { [ pieces ]
          [ pieces ratio * sqrt round >integer :> c
            pieces c /f round >integer c 2array ] }
        { [ inside ] [ inside ratio inside-ratio>pair ] }
        [ f ]
    } cond ;

! Effective aspect ratio if directly given or implied by a square format.
:: effective-ratio ( partial -- ratio/f )
    partial "aspectRatio" g :> given
    partial "format" g :> format
    given [ given ]
    [ format "square" = [ 1.0 ] [ f ] if ] if ;

! Choose the unique valid { rows columns } pair, or f.
:: candidate ( partial -- pair/f )
    partial "rows" g :> rows
    partial "columns" g :> columns
    partial "format" g :> format
    partial effective-ratio :> ratio
    {
        ! rows & columns directly
        { [ rows columns and ] [ rows columns 2array ] }
        ! something plus an aspect ratio (given or square)
        { [ ratio ] [ partial ratio ratio>candidate ] }
        ! piece counts, disambiguated by format
        [ partial counts>pairs
          [ first2 2 >= [ 2 >= ] dip and ] filter
          format [
              [ first2 pair-format format = ] filter
          ] when
          dup length 1 = [ first ] [ drop f ] if ]
    } cond ;

! Build the full assoc from a { rows columns } pair.
:: build ( rows columns -- full )
    rows columns * :> pieces
    rows 2 - columns 2 - * :> inside
    pieces inside - :> border
    columns rows /f :> ratio
    H{ } clone
        pieces "pieces" pick set-at
        border "border" pick set-at
        inside "inside" pick set-at
        rows "rows" pick set-at
        columns "columns" pick set-at
        ratio "aspectRatio" pick set-at
        ratio ratio>format "format" pick set-at ;

! Every key present in partial must match the built full assoc.
:: consistent? ( partial full -- ? )
    partial >alist [ first2 [ full at ] dip = ] all? ;

PRIVATE>

: jigsaw-data ( partial -- full )
    dup candidate [
        first2 build                    ! partial full
        2dup consistent?                ! partial full ?
        [ nip ] [ 2drop "Contradictory data" throw ] if
    ] [ drop "Insufficient data" throw ] if* ;
