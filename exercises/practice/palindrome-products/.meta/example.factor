USING: arrays kernel locals math math.parser sequences ;
IN: palindrome-products

: palindrome? ( n -- ? )
    number>string dup reverse sequence= ;

:: smallest ( mn mx -- result )
    mn mx > [ "min must be <= max" throw ] when
    f :> value!
    V{ } clone :> factors
    mn :> first!
    [ first mx <= ] [
        first :> second!
        [ second mx <= value [ first second * < ] [ f ] if* not and ] [
            first second * :> product
            product palindrome? [
                value [ product > ] [ t ] if* [
                    product value!
                    factors delete-all
                    first second 2array factors push
                ] [
                    product value = [
                        first second 2array factors push
                    ] when
                ] if
            ] when
            second 1 + second!
        ] while
        first 1 + first!
    ] while
    value factors >array 2array ;

:: largest ( mn mx -- result )
    mn mx > [ "min must be <= max" throw ] when
    f :> value!
    V{ } clone :> factors
    mx :> second!
    [ second mn >= ] [
        second :> first!
        [ first mn >= value [ first second * > ] [ f ] if* not and ] [
            first second * :> product
            product palindrome? [
                value [ product < ] [ t ] if* [
                    product value!
                    factors delete-all
                    first second 2array factors push
                ] [
                    product value = [
                        first second 2array factors push
                    ] when
                ] if
            ] when
            first 1 - first!
        ] while
        second 1 - second!
    ] while
    value factors >array 2array ;
