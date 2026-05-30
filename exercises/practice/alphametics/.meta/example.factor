USING: accessors arrays assocs hashtables kernel locals math
math.bitwise math.order ranges sequences sets sorting splitting ;
IN: alphametics

TUPLE: letter ch min-digit rank weight ;

: tokenize ( puzzle -- tokens ) " " split harvest ;

:: word-signs ( tokens -- words )
    -1 :> sign!
    V{ } clone :> acc
    tokens [| tok |
        tok "==" = [ 1 sign! ] [
            tok "+" = [ ] [ tok sign 2array acc push ] if
        ] if
    ] each
    acc ;

: column-count ( words -- ncols ) [ first length ] map maximum ;

: unique-letters ( puzzle -- letters )
    [ CHAR: A CHAR: Z between? ] filter members ;

:: char-weight ( words ncols ch -- weight )
    ncols 0 <array> :> w
    words [| pair |
        pair first :> word
        pair second :> sign
        word length :> len
        len <iota> [| i |
            len 1 - i - word nth ch = [ i w [ sign + ] change-nth ] when
        ] each
    ] each
    w ;

:: leads-word? ( words ch -- ? )
    words [| pair | pair first dup length 1 > swap first ch = and ] any? ;

:: first-nonzero ( weight -- rank )
    weight [ 0 = not ] find drop [ weight length 1 - ] unless* ;

:: <letter> ( words ncols ch -- letter )
    words ncols ch char-weight :> w
    ch  words ch leads-word? 1 0 ?  w first-nonzero  w  letter boa ;

:: make-letters ( puzzle words ncols -- letters )
    puzzle unique-letters [| ch | words ncols ch <letter> ] { } map-as [ rank>> ] sort-by ;


:: column-sum ( letters mapping col -- n )
    letters [| l |
        col l weight>> nth
        l ch>> mapping at 0 or
        *
    ] map-sum ;

: assoc-with ( mapping key val -- mapping' )
    [ clone ] 2dip swap pick set-at ;

! `claimed` is a bitmask of the digits already in use.
: claimed? ( claimed digit -- ? ) 1 swap shift bitand 0 = not ;

: claim ( claimed digit -- claimed' ) 1 swap shift bitor ;

:: search ( ncols letters col carry remaining claimed mapping digit -- result )
    remaining empty? [ t ] [ remaining first rank>> col > ] if
    [
        carry letters mapping col column-sum + :> colsum
        colsum 10 mod 0 = [
            col 1 + ncols < [
                ncols letters col 1 + colsum 10 /i remaining claimed mapping 0 search
            ] [
                colsum 0 = [ mapping ] [ f ] if
            ] if
        ] [ f ] if
    ] [
        remaining first :> entry
        digit entry min-digit>> max :> d
        d 9 > [ f ] [
            claimed d claimed? [
                ncols letters col carry remaining claimed mapping d 1 + search
            ] [
                ncols letters col carry
                remaining rest
                claimed d claim
                mapping entry ch>> d assoc-with
                0 search
                [ ncols letters col carry remaining claimed mapping d 1 + search ] unless*
            ] if
        ] if
    ] if ;

:: solve ( puzzle -- result )
    puzzle tokenize word-signs :> words
    words column-count :> ncols
    puzzle words ncols make-letters :> letters
    ncols letters 0 0 letters 0 H{ } clone 0 search ;
