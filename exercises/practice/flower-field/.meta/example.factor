USING: kernel locals math ranges sequences ;
IN: flower-field

:: flower-at? ( garden r c -- ? )
    r 0 >= r garden length < and [
        r garden nth :> row
        c 0 >= c row length < and
        [ c row nth CHAR: * = ] [ f ] if
    ] [ f ] if ;

:: neighbor-count ( garden r c -- n )
    0
    r 1 - r 1 + [a..b] [| nr |
        c 1 - c 1 + [a..b] [| nc |
            nr r = nc c = and not [
                garden nr nc flower-at? [ 1 + ] when
            ] when
        ] each
    ] each ;

:: annotate-cell ( garden r c -- ch )
    c r garden nth nth :> cell
    cell CHAR: * = [ cell ] [
        garden r c neighbor-count :> n
        n 0 = [ CHAR: \s ] [ n CHAR: 0 + ] if
    ] if ;

:: annotate ( garden -- annotated )
    garden length [0..b) [| r |
        r garden nth length [0..b) [| c |
            garden r c annotate-cell
        ] "" map-as
    ] map ;
