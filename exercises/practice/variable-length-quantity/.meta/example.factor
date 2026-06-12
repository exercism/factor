USING: arrays combinators kernel math sequences ;
IN: variable-length-quantity

<PRIVATE

! The continuation groups of n (most significant first), each with the
! high bit set. Recurses down to the empty sequence when n reaches 0.
: high-groups ( n -- bytes )
    dup 0 =
    [ drop { } ]
    [ [ -7 shift high-groups ] [ 127 bitand 0x80 bitor ] bi suffix ] if ;

: encode-single ( n -- bytes )
    [ -7 shift high-groups ] [ 127 bitand ] bi suffix ;

PRIVATE>

: encode ( integers -- bytes )
    [ encode-single ] map concat >array ;

<PRIVATE

! Walk the bytes, folding 7-bit groups into acc until a byte clears the
! high bit. pending tracks whether we are part-way through a value, so a
! sequence ending mid-value is reported as incomplete.
:: (decode) ( bytes acc pending -- integers )
    bytes empty?
    [ pending [ "incomplete sequence" throw ] [ { } ] if ]
    [
        bytes rest :> more
        acc 7 shift  bytes first 127 bitand  bitor :> acc'
        bytes first 0x80 bitand 0 =
        [ more 0 f (decode) acc' prefix ]
        [ more acc' t (decode) ]
        if
    ] if ;

PRIVATE>

: decode ( bytes -- integers )
    0 f (decode) >array ;
