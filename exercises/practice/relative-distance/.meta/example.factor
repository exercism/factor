USING: assocs deques dlists kernel locals math sequences ;
IN: relative-distance

! Build an undirected graph: each parent is linked to each child, and
! children of the same parent (siblings) are linked to one another.
:: build-adjacency ( family-tree -- adj )
    H{ } clone :> adj
    ! give every parent and child its own (initially empty) neighbour list
    family-tree [| parent children |
        parent adj [ drop V{ } clone ] cache drop
        children [ adj [ drop V{ } clone ] cache drop ] each
    ] assoc-each
    family-tree [| parent children |
        children [| child |
            child parent adj at push
            parent child adj at push
        ] each
        children [| c1 |
            children [| c2 |
                c1 c2 = [ c2 c1 adj at push ] unless
            ] each
        ] each
    ] assoc-each
    adj ;

:: degree-of-separation ( family-tree person-a person-b -- n/f )
    family-tree build-adjacency :> adj
    H{ } clone :> dist
    0 person-a dist set-at
    <dlist> :> queue
    person-a queue push-back
    [ queue deque-empty? not ] [
        queue pop-front :> current
        current dist at :> d
        current adj at [
            [| neighbour |
                neighbour dist key? not [
                    d 1 + neighbour dist set-at
                    neighbour queue push-back
                ] when
            ] each
        ] when*
    ] while
    person-b dist at ;
