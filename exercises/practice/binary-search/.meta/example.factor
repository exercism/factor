USING: combinators kernel locals math sequences ;
IN: binary-search

ERROR: value-not-in-array ;

:: search-range ( array value low high -- index )
    low high > [ value-not-in-array ] [
        low high + 2 /i :> mid
        mid array nth :> probe
        {
            { [ probe value = ] [ mid ] }
            { [ probe value < ] [ array value mid 1 + high search-range ] }
            [ array value low mid 1 - search-range ]
        } cond
    ] if ;

: find ( array value -- index )
    over length 1 - [ 0 ] dip search-range ;
