USING: kernel sequences ;
IN: resistor-color

CONSTANT: colors { "black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white" }

: color>code ( color -- n )
   colors index ;
