USING: accessors arrays assocs deques dlists hash-sets kernel
       locals math memoize sequences sets sorting ;
IN: pirates-path

:: tide-queue ( items -- popped )
    <dlist> :> q
    items [ q push-back ] each
    V{ } clone
    [ q deque-empty? ] [ q pop-front over push ] until
    >array ;

:: coves-reachable ( start chart -- coves )
    HS{ } clone :> visited
    <dlist> :> frontier
    start visited adjoin
    start frontier push-back
    [ frontier deque-empty? ] [
        frontier pop-front chart at [
            dup visited in? [ drop ] [
                [ visited adjoin ] [ frontier push-back ] bi
            ] if
        ] each
    ] until
    visited ;

:: hop-count ( start goal chart -- n/f )
    HS{ } clone :> visited
    <dlist> :> frontier
    f :> answer!
    start visited adjoin
    { start 0 } frontier push-back
    [ frontier deque-empty? answer or ] [
        frontier pop-front first2 :> ( cove dist )
        cove goal = [ dist answer! ] [
            cove chart at [
                dup visited in? [ drop ] [
                    [ visited adjoin ]
                    [ dist 1 + 2array frontier push-back ] bi
                ] if
            ] each
        ] if
    ] until
    answer ;

CONSTANT: gold-distribution H{
    { "Hidden Cove"        80 }
    { "Skull Bay"         120 }
    { "Reef Point"         40 }
    { "Smuggler's Hollow" 200 }
    { "Plank Island"       60 }
    { "Lantern Rock"      150 }
}

MEMO: gold-count ( cove -- n )
    gold-distribution at 0 or ;

:: treasure-route ( start chart -- best-cove )
    start chart coves-reachable members
    [ [ gold-count ] keep 2array ] map sort last second ;
