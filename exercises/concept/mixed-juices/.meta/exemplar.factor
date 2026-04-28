USING: combinators kernel locals math sequences ;
IN: mixed-juices

: time-to-mix-juice ( juice -- minutes )
    {
        { [ dup "Pure Strawberry Joy" = ] [ drop 0.5 ] }
        { [ dup "Energizer"           = ] [ drop 1.5 ] }
        { [ dup "Green Garden"        = ] [ drop 1.5 ] }
        { [ dup "Tropical Island"     = ] [ drop 3   ] }
        { [ dup "All or Nothing"      = ] [ drop 5   ] }
        [ drop 2.5 ]
    } cond ;

: wedges-from-lime ( size -- wedges )
    {
        { [ dup "small"  = ] [ drop 6  ] }
        { [ dup "medium" = ] [ drop 8  ] }
        [ drop 10 ]
    } cond ;

:: limes-to-cut ( needed limes -- count )
    needed :> need!
    limes  :> rem!
    0      :> count!
    [ need 0 > rem length 0 > and ] [
        rem unclip [ rem! ] dip
        wedges-from-lime
        need swap - need!
        count 1 + count!
    ] while
    count ;

: order-times ( orders -- times )
    [ time-to-mix-juice ] map ;

:: remaining-orders ( time-left orders -- remaining )
    time-left :> tleft!
    orders    :> rem!
    [ tleft 0 > rem length 0 > and ] [
        rem unclip [ rem! ] dip
        time-to-mix-juice
        tleft swap - tleft!
    ] while
    rem ;
