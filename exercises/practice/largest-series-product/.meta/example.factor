USING: combinators grouping kernel math math.parser math.statistics sequences strings unicode ;
IN: largest-series-product

ERROR: invalid-input ;

: largest-product ( digits span -- product )
    {
        { [ dup 0 < ] [ 2drop invalid-input ] }
        { [ 2dup [ length ] dip < ] [ 2drop invalid-input ] }
        { [ over [ digit? ] all? not ] [ 2drop invalid-input ] }
        { [ dup 0 = ] [ 2drop 1 ] }
        [ clump [ [ digit> ] map product ] map supremum ]
    } cond ;
