USING: kernel math sequences ;
IN: resistor-color-duo

CONSTANT: colors { "black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white" }

: color>code ( color -- n )
    colors index ;

: value ( colors -- n )
    2 head [ color>code ] map first2 [ 10 * ] dip + ;
