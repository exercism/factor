USING: accessors arrays assocs hashtables kernel locals math
math.order sequences sets sorting splitting ;
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
    puzzle unique-letters [| ch | words ncols ch <letter> ] { } map-as
    [ rank>> ] sort-by ;

! Sum of (weight-in-this-column * assigned-digit) over every letter.
! Unassigned letters have a zero weight here, so their stale digit
! contributes nothing -- no per-step reset of `assigned` is needed.
:: column-sum ( letters assigned col -- n )
    letters assigned 0 [| acc l d | acc col l weight>> nth d * + ] 2reduce ;

: claimed? ( claimed digit -- ? ) 1 swap shift bitand 0 = not ;
: claim ( claimed digit -- claimed' ) 1 swap shift bitor ;

! Smallest unclaimed digit >= d, or 10 if there is none.
:: next-free ( claimed d -- d' )
    d 10 >= [ 10 ] [ claimed d claimed? [ claimed d 1 + next-free ] [ d ] if ] if ;

:: search ( ncols letters assigned col carry k claimed digit -- ? )
    k letters length >= [ t ] [ k letters nth rank>> col > ] if
    [
        carry letters assigned col column-sum + :> colsum
        colsum 10 mod 0 = [
            col 1 + ncols < [
                ncols letters assigned col 1 + colsum 10 /i k claimed 0 search
            ] [
                colsum 0 =
            ] if
        ] [ f ] if
    ] [
        k letters nth :> entry
        claimed  digit entry min-digit>> max  next-free  :> d
        d 9 > [ f ] [
            d k assigned set-nth
            ncols letters assigned col carry k 1 + claimed d claim 0 search
            [ ncols letters assigned col carry k claimed d 1 + search ] unless*
        ] if
    ] if ;

:: letters>mapping ( letters assigned -- hashtable )
    H{ } clone :> result
    letters assigned [| l d | d l ch>> result set-at ] 2each
    result ;

:: solve ( puzzle -- result )
    puzzle tokenize word-signs :> words
    words column-count :> ncols
    puzzle words ncols make-letters :> letters
    letters length 0 <array> :> assigned
    ncols letters assigned 0 0 0 0 0 search
    [ letters assigned letters>mapping ] [ f ] if ;
