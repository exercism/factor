USING: ascii kernel sequences splitting ;
IN: acronym

: acronym ( str -- abbr )
    " -_" split
    [ empty? ] reject
    [ 1 head ] map
    "" join
    >upper
;

