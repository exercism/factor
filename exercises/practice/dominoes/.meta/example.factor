USING: arrays kernel locals math math.bitwise ranges sequences ;
IN: dominoes

! Union-Find on nibble values 0-15
:: find-root ( parent i -- root )
    i :> r!
    [ r parent nth r = not ] [ r parent nth r! ] while
    r ;

:: union ( parent a b -- )
    parent a find-root :> ra
    parent b find-root :> rb
    ra rb = not [ rb ra parent set-nth ] when ;

:: can-chain? ( dominoes -- ? )
    dominoes empty? [ t ] [
        16 0 <array> :> degree
        16 <iota> >array :> parent
        dominoes [| stone |
            stone -4 shift :> left
            stone 0xf bitand :> right
            left degree [ 1 + ] change-nth
            right degree [ 1 + ] change-nth
            parent left right union
        ] each
        ! all degrees even
        degree [ dup 0 = swap 2 mod 0 = or ] all?
        ! all used vertices in same component
        [
            16 <iota> [ degree nth 0 > ] filter :> used
            used empty? [ t ] [
                used first :> rep
                parent rep find-root :> root
                used [ parent swap find-root root = ] all?
            ] if
        ] [ f ] if
    ] if ;
