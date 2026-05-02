USING: accessors arrays kernel locals math math.functions
sequences ;
IN: rational-numbers

TUPLE: rat numerator denominator ;

<PRIVATE
: euclid ( a b -- g )
    [ abs ] bi@ [ dup zero? ] [ swap over mod ] until drop ;

: normalize ( num denom -- num' denom' )
    2dup euclid [ /i ] curry bi@
    dup 0 < [ [ neg ] bi@ ] when ;
PRIVATE>

: <rat> ( num denom -- rat ) normalize rat boa ;

: >rat ( pair -- rat ) first2 <rat> ;

: rat>pair ( rat -- pair )
    [ numerator>> ] [ denominator>> ] bi 2array ;

:: r+ ( a b -- c )
    a numerator>> b denominator>> *
    b numerator>> a denominator>> * +
    a denominator>> b denominator>> *
    <rat> ;

:: r- ( a b -- c )
    a numerator>> b denominator>> *
    b numerator>> a denominator>> * -
    a denominator>> b denominator>> *
    <rat> ;

:: r* ( a b -- c )
    a numerator>> b numerator>> *
    a denominator>> b denominator>> *
    <rat> ;

:: r/ ( a b -- c )
    a numerator>> b denominator>> *
    a denominator>> b numerator>> *
    <rat> ;

: r-abs ( a -- |a| )
    [ numerator>> abs ] [ denominator>> abs ] bi <rat> ;

: r>float ( a -- x )
    [ numerator>> ] [ denominator>> ] bi /f ;

:: r^ ( a n -- a^n )
    n 0 >= [ a numerator>> a denominator>> ]
           [ a denominator>> a numerator>> ] if
    n abs [ ^ ] curry bi@ <rat> ;

: real^r ( x a -- y )
    r>float ^ ;
