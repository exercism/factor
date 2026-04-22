USING: kernel math ranges sequences ;
IN: sum-of-multiples

: multiple? ( n factors -- ? )
    [ dup 0 > [ mod 0 = ] [ 2drop f ] if ] with any? ;

: sum-of-multiples ( factors limit -- sum )
    [1..b) [ over multiple? ] filter sum nip ;
