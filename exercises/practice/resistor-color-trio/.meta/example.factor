USING: combinators kernel locals math math.functions math.parser sequences ;
IN: resistor-color-trio

CONSTANT: colors { "black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white" }

CONSTANT: units { "ohms" "kiloohms" "megaohms" "gigaohms" }

: color>code ( color -- n )
    colors index ;

:: label ( color-seq -- str )
    color-seq [ color>code ] map :> codes
    codes first 10 * codes second + codes third 10 swap ^ * :> total
    {
        { [ total 1000000000 >= ] [ 3 ] }
        { [ total 1000000 >= ] [ 2 ] }
        { [ total 1000 >= ] [ 1 ] }
        [ 0 ]
    } cond :> prefix
    total 10 * 1000 prefix ^ /i 10 /mod :> ( whole digit )
    digit zero?
    [ whole number>string ]
    [ whole number>string "." append digit number>string append ]
    if
    " " append
    prefix units nth append ;
