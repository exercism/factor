USING: arrays fry kernel math math.vectors sequences ;
IN: coordinate-choreography

: translate-2d ( dx dy -- quot )
    2array [ v+ ] curry ;

: scale-2d ( sx sy -- quot )
    2array [ v* ] curry ;

: compose-transformations ( f g -- h )
    compose ;

: apply-transformation ( point f -- point' )
    call( p -- p' ) ;

: affine-2d ( a b c d -- quot )
    '[
        first2 2dup
        [ _ * ] [ _ * ] bi* +
        -rot
        [ _ * ] [ _ * ] bi* +
        2array
    ] ;

: transform-points ( points f -- points' )
    '[ _ apply-transformation ] map ;
