USING: assocs combinators hash-sets kernel locals sequences sets ;
IN: lighthouse-logbook

: empty-log ( -- log )
    HS{ } clone ;

: sight ( log callsign -- )
    swap adjoin ;

: seen? ( log callsign -- ? )
    swap in? ;

: forget-sighting ( log callsign -- )
    swap delete ;

: unique-count ( log -- n )
    cardinality ;

:: reachable ( start relay-map -- visited )
    HS{ } clone :> visited
    V{ } clone :> frontier
    start visited adjoin
    start frontier push
    [ frontier empty? not ] [
        frontier pop relay-map at [
            dup visited in? [ drop ] [
                [ visited adjoin ] [ frontier push ] bi
            ] if
        ] each
    ] while
    visited ;
