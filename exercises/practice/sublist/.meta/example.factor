USING: kernel locals math ranges sequences ;
IN: sublist

! Is the whole of `needle` a contiguous run somewhere in `haystack`?
:: contained? ( needle haystack -- ? )
    needle length :> n
    haystack length :> h
    n h > [ f ] [
        0 h n - [a..b] [
            dup n + haystack subseq needle =
        ] any?
    ] if ;

: relation ( list-one list-two -- result )
    2dup = [ 2drop "equal" ] [
        2dup contained? [ 2drop "sublist" ] [
            swap contained? [ "superlist" ] [ "unequal" ] if
        ] if
    ] if ;
