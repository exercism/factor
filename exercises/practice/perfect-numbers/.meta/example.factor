USING: combinators kernel locals math ;
IN: perfect-numbers

:: sigma ( n -- sum )
    n :> remaining!
    1 :> result!
    2 :> p!
    1 :> step!
    [ p p * remaining <= ] [
        remaining p mod 0 = [
            1 :> series!
            [ remaining p mod 0 = ] [
                remaining p /i remaining!
                p series * 1 + series!
            ] while
            result series * result!
        ] when
        p step + p!
        2 step!
    ] while
    remaining 1 > [
        result remaining 1 + * result!
    ] when
    result ;

: classify ( n -- str )
    dup 0 > [ "Classification is only possible for positive integers." throw ] unless
    dup 2 * swap sigma {
        { [ 2dup > ] [ 2drop "deficient" ] }
        { [ 2dup < ] [ 2drop "abundant" ] }
        [ 2drop "perfect" ]
    } cond ;
