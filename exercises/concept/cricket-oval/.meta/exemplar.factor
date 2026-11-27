USING: kernel math math.constants math.functions math.libm ;
IN: cricket-oval

: boundary-length ( radius -- length )
    2 * pi * ;

: distance-from-pitch ( x y -- distance )
    [ sq ] bi@ + sqrt ;

: shot-angle ( x y -- degrees )
    swap fatan2 rad>deg ;

: carry ( speed angle -- metres )
    [ sq ] [ deg>rad 2 * sin ] bi* * 9.8 / ;

: speed-after ( speed metres -- speed' )
    -0.02 * e^ * ;

: metres-until ( speed target -- metres )
    / log 0.02 / ;
