USING: arrays kernel locals math sequences strings ;
IN: rail-fence-cipher

:: rail-pattern ( len rails -- seq )
    rails 1 - 2 * :> cycle
    len <iota> [
        cycle mod dup cycle 2 /i > [ cycle swap - ] when
    ] map ;

:: encode ( msg rails -- cipher )
    msg length rails rail-pattern :> pattern
    rails <iota> [| r |
        msg length <iota> [ dup pattern nth r = [ msg nth ] [ drop f ] if ] map
        [ ] filter >string
    ] map concat ;

:: decode ( msg rails -- plain )
    msg length rails rail-pattern :> pattern
    rails <iota> [| r | pattern [ r = ] count ] map :> lengths
    lengths length 0 <array> :> offsets
    0 lengths length <iota> [| i |
        dup i offsets set-nth
        i lengths nth +
    ] each drop
    msg length 0 <array> :> result
    rails <iota> [| r |
        0 :> pos!
        msg length <iota> [| i |
            i pattern nth r = [
                r offsets nth pos + msg nth
                i result set-nth
                pos 1 + pos!
            ] when
        ] each
    ] each
    result >string ;
