USING: arrays grouping kernel math sequences strings ;
IN: intergalactic-transmission

<PRIVATE

CONSTANT: hex-digits "0123456789abcdef"

: hex-char>value ( ch -- n )
    dup CHAR: a >= [ CHAR: a - 10 + ] [ CHAR: 0 - ] if ;

: byte>bits ( byte -- bits )
    8 <iota> [ 7 swap - neg shift 1 bitand ] with map ;

: hex>byte ( str -- byte )
    2 tail [ hex-char>value ] map
    first2 [ 16 * ] dip + ;

: byte>hex ( byte -- str )
    [ 16 /i ] [ 16 mod ] bi
    [ hex-digits nth ] bi@ 2array >string "0x" prepend ;

: bits>byte ( bits -- byte )
    0 [ [ 1 shift ] dip bitor ] reduce ;

: parity ( bits -- p )
    sum 2 mod ;

PRIVATE>

: transmit-sequence ( message -- sequence )
    [ hex>byte byte>bits ] map concat
    7 group [ 7 0 pad-tail >array ] map
    [ dup parity suffix bits>byte byte>hex ] map ;

: decode-message ( sequence -- message )
    [ hex>byte byte>bits ] map
    dup [ parity 0 = [ "wrong parity" throw ] unless ] each
    [ 7 head ] map concat
    8 group [ length 8 = ] filter
    [ >array bits>byte byte>hex ] map ;
