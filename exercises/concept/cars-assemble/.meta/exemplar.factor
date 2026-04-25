USING: combinators kernel math math.functions ;
IN: cars-assemble

CONSTANT: base-speed 221

: success-rate ( speed -- rate )
    {
        { [ dup zero? ] [ drop 0.0  ] }
        { [ dup 4 <=  ] [ drop 1.0  ] }
        { [ dup 8 <=  ] [ drop 0.9  ] }
        { [ dup 9 =   ] [ drop 0.8  ] }
        [ drop 0.77 ]
    } cond ;

: production-rate-per-hour ( speed -- rate )
    [ base-speed * ] [ success-rate ] bi * ;

: working-items-per-minute ( speed -- count )
    production-rate-per-hour 60 / floor >integer ;
