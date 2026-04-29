USING: arrays kernel locals math math.parser sequences ;
IN: palindrome-products

: palindrome? ( n -- ? )
    number>string dup reverse = ;

:: smallest ( mn mx -- value factors )
    mn mx > [ "min must be <= max" throw ] when
    f :> v!
    V{ } clone :> facs
    mn :> first!
    [ first mx <= ] [
        first :> second!
        [ second mx <= v [ first second * < ] [ f ] if* not and ] [
            first second * :> product
            product palindrome? [
                v [ product > ] [ t ] if* [
                    product v!
                    facs delete-all
                    first second 2array facs push
                ] [
                    product v = [
                        first second 2array facs push
                    ] when
                ] if
            ] when
            second 1 + second!
        ] while
        first 1 + first!
    ] while
    v facs >array ;

:: largest ( mn mx -- value factors )
    mn mx > [ "min must be <= max" throw ] when
    f :> v!
    V{ } clone :> facs
    mx :> second!
    [ second mn >= ] [
        second :> first!
        [ first mn >= v [ first second * > ] [ f ] if* not and ] [
            first second * :> product
            product palindrome? [
                v [ product < ] [ t ] if* [
                    product v!
                    facs delete-all
                    first second 2array facs push
                ] [
                    product v = [
                        first second 2array facs push
                    ] when
                ] if
            ] when
            first 1 - first!
        ] while
        second 1 - second!
    ] while
    v facs >array ;
