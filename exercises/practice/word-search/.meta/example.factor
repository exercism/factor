USING: arrays assocs kernel locals math sequences ;
IN: word-search

<PRIVATE

CONSTANT: directions {
    { -1 -1 } { -1 0 } { -1 1 }
    {  0 -1 }          {  0 1 }
    {  1 -1 } {  1 0 } {  1 1 }
}

:: in-grid? ( r c grid -- ? )
    r 0 >= r grid length < and
    [ c 0 >= c r grid nth length < and ] [ f ] if ;

! Does word appear in grid starting at (r,c) heading in direction (dr,dc)?
:: match-at? ( word r c dr dc grid -- ? )
    word length <iota> [| i |
        r i dr * + :> rr
        c i dc * + :> cc
        rr cc grid in-grid?
        [ i word nth  cc rr grid nth nth = ] [ f ] if
    ] all? ;

! Find the first occurrence of word; return { start end } as 1-indexed
! { column row } points, or f when absent.
:: find-word ( word grid -- loc/f )
    f :> result!
    grid length <iota> [| r |
        grid first length <iota> [| c |
            directions [| dir |
                result [
                    word r c  dir first  dir second  grid match-at? [
                        word length 1 - :> k
                        c 1 + r 1 + 2array
                        c k dir second * + 1 +  r k dir first * + 1 + 2array
                        2array result!
                    ] when
                ] unless
            ] each
        ] each
    ] each
    result ;

PRIVATE>

:: search ( grid words -- results )
    words [ dup grid find-word ] H{ } map>assoc ;
