USING: ascii kernel sequences splitting ;
IN: log-levels

: message ( log-line -- message )
    ": " split1 nip [ blank? ] trim ;

: log-level ( log-line -- level )
    "[]" split harvest first >lower ;

: reformat ( log-line -- formatted )
    [ message ] [ log-level ] bi "(" ")" surround " " glue ;
