USING: combinators kernel math sequences ;
IN: backyard-birdcount

: today ( days -- count/f )
    [ f ] [ first ] if-empty ;

: increment-day-count ( days -- new-days )
    [ { 1 } ] [ unclip 1 + prefix ] if-empty ;

: has-day-without-birds? ( days -- ? )
    {
        { [ dup empty? ] [ drop f ] }
        { [ dup first zero? ] [ drop t ] }
        [ rest has-day-without-birds? ]
    } cond ;

: total ( days -- sum )
    [ 0 ] [ unclip swap total + ] if-empty ;

: busy-days ( days -- count )
    [ 0 ] [
        unclip 5 >= [ busy-days 1 + ] [ busy-days ] if
    ] if-empty ;
