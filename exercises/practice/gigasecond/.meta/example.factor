USING: calendar combinators formatting kernel math.parser sequences splitting ;
IN: gigasecond

: gigasecond-after ( moment -- moment )
    "T" split1
    [ "-" split [ string>number ] map first3 ]
    [ "00:00:00" or ":" split [ string>number ] map first3 ]
    bi*
    instant <timestamp> 1000000000 seconds time+
    [ >date< ] [ >time< ] bi
    "%04d-%02d-%02dT%02d:%02d:%02d" sprintf ;
