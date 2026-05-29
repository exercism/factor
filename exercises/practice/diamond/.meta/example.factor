USING: kernel math sequences strings ;
IN: diamond

<PRIVATE

:: diamond-row ( n i -- str )
    i CHAR: A + :> ch
    i zero?
    [ ch 1string ]
    [ ch 1string i 2 * CHAR: space pad-tail ch suffix ] if
    n i + 1 + CHAR: space pad-head
    n 2 * 1 + CHAR: space pad-tail ;

PRIVATE>

:: rows ( letter -- rows )
    letter CHAR: A - :> n
    n 1 + <iota> [ n swap diamond-row ] map
    dup but-last reverse append ;
