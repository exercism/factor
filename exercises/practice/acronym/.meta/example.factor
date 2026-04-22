USING: ascii kernel sequences splitting ;
IN: acronym

: abbreviate ( phrase -- acronym )
    " -_" split
    [ empty? ] reject
    [ 1 head ] map
    "" join
    >upper ;
