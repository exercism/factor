USING: assocs combinators kernel locals math sequences ;
IN: lasagna-luminary

: cooking-status ( timer -- string )
    {
        { [ dup not ] [ drop "You forgot to set the timer." ] }
        { [ dup zero? ] [ drop "Lasagna is done." ] }
        [ drop "Not done, please wait." ]
    } cond ;

:: preparation-time ( layers minutes-per-layer -- total )
    layers length minutes-per-layer * ;

:: quantities ( layers -- noodles sauce )
    layers [ "noodles" = ] count 50 *
    layers [ "sauce" = ] count 1/5 * ;

:: add-secret-ingredient ( friends-list my-list -- new-list )
    my-list friends-list last suffix ;

:: scale-recipe ( recipe portions -- new-recipe )
    recipe [| key value | key value portions * 2 / ] assoc-map ;
