USING: kernel math ;
IN: square-root

: square-root ( n -- root )
    0 over [ 2dup = not ]
    [ nip dup dup 1 + * pick + over 2 * /i ]
    while nip nip ;
