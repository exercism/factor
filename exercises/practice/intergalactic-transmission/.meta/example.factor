USING: arrays grouping kernel math sequences ;
IN: intergalactic-transmission

<PRIVATE

: byte>bits ( byte -- bits )
    8 <iota> [ 7 swap - neg shift 1 bitand ] with map ;

: bits>byte ( bits -- byte )
    0 [ [ 1 shift ] dip bitor ] reduce ;

: parity ( bits -- p )
    sum 2 mod ;

PRIVATE>

: transmit-sequence ( message -- sequence )
    [ byte>bits ] map concat
    7 group [ 7 0 pad-tail >array ] map
    [ dup parity suffix bits>byte ] map ;

: decode-message ( sequence -- message )
    [ byte>bits ] map
    dup [ parity 0 = [ "wrong parity" throw ] unless ] each
    [ 7 head ] map concat
    8 group [ length 8 = ] filter
    [ >array bits>byte ] map ;
