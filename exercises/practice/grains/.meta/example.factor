USING: kernel math math.order ;
IN: grains

: square ( n -- grains )
    dup 1 64 between? [ "square must be between 1 and 64" throw ] unless
    1 swap 1 - shift ;

: total ( -- grains ) 1 64 shift 1 - ;
