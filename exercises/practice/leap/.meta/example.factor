USING: combinators kernel math ;
IN: leap

: leap-year? ( year -- ? )
    {
        { [ dup 400 mod zero? ] [ drop t ] }
        { [ dup 100 mod zero? ] [ drop f ] }
        { [ dup   4 mod zero? ] [ drop t ] }
        [ drop f ]
    } cond ;
