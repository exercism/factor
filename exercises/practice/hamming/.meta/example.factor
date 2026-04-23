USING: assocs kernel math sequences ;
IN: hamming

: distance ( strand1 strand2 -- n )
    2dup [ length ] bi@ =
    [ zip [ first2 = not ] count ]
    [ "strands must be of equal length" throw ] if ;
