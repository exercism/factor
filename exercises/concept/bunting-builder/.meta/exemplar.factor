USING: kernel math ranges sequences strings ;
IN: bunting-builder

: alphabet-bunting ( n -- str )
    <iota> [ CHAR: a + ] map >string ;

: counting-bunting ( n -- str )
    <iota> [ 10 mod CHAR: 0 + ] map >string ;

: stripe-bunting ( n -- str )
    <iota> [ even? [ CHAR: * ] [ CHAR: - ] if ] map >string ;

: marker-bunting ( n -- str )
    <iota> [ 5 mod zero? [ CHAR: | ] [ CHAR: . ] if ] map >string ;

: valley-bunting ( -- str )
    -5 5 [a..b) [ abs CHAR: 0 + ] map >string ;
