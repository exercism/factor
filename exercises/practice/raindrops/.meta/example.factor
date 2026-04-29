USING: arrays combinators kernel math.functions math.parser sequences ;
IN: raindrops

: convert ( n -- str )
    dup
    [ 3 divisor? "Pling" and ]
    [ 5 divisor? "Plang" and ]
    [ 7 divisor? "Plong" and ] tri
    3array sift
    [ number>string ] [ concat swap drop ] if-empty ;
