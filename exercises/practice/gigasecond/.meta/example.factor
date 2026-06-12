USING: accessors calendar kernel math math.parser sequences
splitting ;
IN: gigasecond

<PRIVATE

: pad2 ( n -- str ) number>string 2 CHAR: 0 pad-head ;

! Parse "YYYY-MM-DD" or "YYYY-MM-DDTHH:MM:SS" into a timestamp.
:: parse-moment ( str -- timestamp )
    str "T" split1 :> ( datepart timepart )
    datepart "-" split [ string>number ] map first3 :> ( y mo d )
    timepart [ "00:00:00" ] unless* ":" split [ string>number ] map
    first3 :> ( h mi s )
    y mo d h mi s instant <timestamp> ;

:: format-moment ( ts -- str )
    ts year>> number>string
    ts month>> pad2 "-" glue
    ts day>> pad2 "-" glue
    ts hour>> pad2 "T" glue
    ts minute>> pad2 ":" glue
    ts second>> >integer pad2 ":" glue ;

PRIVATE>

: gigasecond-after ( moment -- moment )
    parse-moment 1000000000 seconds time+ format-moment ;
