USING: combinators kernel math ;
IN: eliuds-eggs

: egg-count ( n -- count )
    {
        { [ dup zero? ] [ drop 0 ] }
        [ dup 1 bitand swap -1 shift egg-count + ]
    } cond ;
