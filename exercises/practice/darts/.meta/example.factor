USING: combinators kernel math math.functions ;
IN: darts

: score ( x y -- n )
    sq swap sq +
    {
        { [ dup   1 <= ] [ drop 10 ] }
        { [ dup  25 <= ] [ drop  5 ] }
        { [ dup 100 <= ] [ drop  1 ] }
        [ drop 0 ]
    } cond ;
