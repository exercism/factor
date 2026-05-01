USING: accessors arrays kernel locals math math.functions
sequences ;
IN: complex-numbers

TUPLE: cmplx real imaginary ;

: <cmplx> ( real imag -- cmplx ) cmplx boa ;

: >cmplx ( pair -- cmplx ) first2 <cmplx> ;

: cmplx>pair ( cmplx -- pair )
    [ real>> ] [ imaginary>> ] bi 2array ;

:: c+ ( a b -- c )
    a real>> b real>> +
    a imaginary>> b imaginary>> +
    <cmplx> ;

:: c- ( a b -- c )
    a real>> b real>> -
    a imaginary>> b imaginary>> -
    <cmplx> ;

:: c* ( a b -- c )
    a real>> b real>> * a imaginary>> b imaginary>> * -
    a real>> b imaginary>> * a imaginary>> b real>> * +
    <cmplx> ;

:: c/ ( a b -- c )
    b real>> sq b imaginary>> sq + :> denom
    a real>> b real>> * a imaginary>> b imaginary>> * + denom /
    a imaginary>> b real>> * a real>> b imaginary>> * - denom /
    <cmplx> ;

: c-abs ( a -- |a| )
    [ real>> sq ] [ imaginary>> sq ] bi + sqrt ;

: c-conj ( a -- a* )
    [ real>> ] [ imaginary>> neg ] bi <cmplx> ;

:: c-exp ( z -- e^z )
    z real>> e^ :> ea
    z imaginary>> :> b
    ea b cos *
    ea b sin *
    <cmplx> ;
