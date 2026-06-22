USING: continuations kernel math sequences ;
IN: factory-failsafe

ERROR: machine-error ;

: check-humidity ( h -- )
    70 > [ "humidity too high" throw ] when ;

: check-temperature ( t -- )
    500 > [ "temperature too high" throw ] when ;

: monitor ( h t -- )
    [ [ check-humidity ] [ drop machine-error ] recover ]
    [ [ check-temperature ] [ drop machine-error ] recover ]
    bi* ;

: monitor-batch ( readings -- count )
    [ [ first2 monitor f ] [ 2drop t ] recover ] count ;
