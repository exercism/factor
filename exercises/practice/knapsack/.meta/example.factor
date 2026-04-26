USING: accessors kernel locals math math.order sequences ;
IN: knapsack

TUPLE: item weight value ;

:: maximum-value ( max-weight items -- value )
    items empty? [ 0 ] [
        items unclip :> first :> rest
        first weight>> max-weight > [
            max-weight rest maximum-value
        ] [
            max-weight rest maximum-value
            max-weight first weight>> - rest maximum-value first value>> +
            max
        ] if
    ] if ;
