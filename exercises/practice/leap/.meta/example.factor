USING: combinators kernel math.functions ;
IN: leap

: leap-year? ( year -- ? )
    [ 4 divisor? ] [ 100 divisor? not ] [ 400 divisor? ] tri or and ;
