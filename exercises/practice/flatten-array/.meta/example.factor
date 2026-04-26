USING: arrays combinators kernel sequences ;
IN: flatten-array

DEFER: flatten

: flatten-elt ( elt -- seq )
    {
        { [ dup not ] [ drop { } ] }
        { [ dup array? ] [ flatten ] }
        [ 1array ]
    } cond ;

: flatten ( array -- flat )
    [ flatten-elt ] map concat ;
