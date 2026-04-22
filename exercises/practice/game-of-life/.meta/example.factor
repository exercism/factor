USING: kernel locals math math.bitwise ranges sequences ;
IN: game-of-life

:: cell-alive? ( matrix cols r c -- ? )
    r 0 >= r matrix length < and
    c 0 >= c cols < and and
    [ r matrix nth cols 1 - c - bit? ] [ f ] if ;

:: count-neighbors ( matrix cols r c -- n )
    0
    r 1 - r 1 + [a..b] [| nr |
        c 1 - c 1 + [a..b] [| nc |
            nr r = nc c = and not [
                matrix cols nr nc cell-alive? [ 1 + ] when
            ] when
        ] each
    ] each ;

:: tick-cell ( matrix cols r c -- bit )
    matrix cols r c count-neighbors :> n
    matrix cols r c cell-alive?
    [ n 2 = n 3 = or ]
    [ n 3 = ] if
    [ 1 cols 1 - c - shift ] [ 0 ] if ;

:: tick-row ( matrix cols r -- row )
    0 cols [0..b) [| c |
        matrix cols r c tick-cell bitor
    ] each ;

:: tick ( matrix cols -- matrix' )
    matrix length [0..b) [| r |
        matrix cols r tick-row
    ] map ;
