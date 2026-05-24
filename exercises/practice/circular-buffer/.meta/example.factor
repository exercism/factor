USING: accessors deques dlists kernel math ;
IN: circular-buffer

TUPLE: circular-buffer cap count items ;

: <circular-buffer> ( capacity -- buffer )
    <dlist> 0 swap circular-buffer boa ;

: cb-full? ( buffer -- ? )
    [ count>> ] [ cap>> ] bi >= ;

: cb-empty? ( buffer -- ? )
    count>> 0 = ;

: write ( item buffer -- )
    dup cb-full?
    [ "buffer full" throw ]
    [ [ 1 + ] change-count items>> push-back ] if ;

: read ( buffer -- item )
    dup cb-empty?
    [ "buffer empty" throw ]
    [ [ 1 - ] change-count items>> pop-front ] if ;

: overwrite ( item buffer -- )
    dup cb-full?
    [ [ items>> pop-front drop ] [ items>> push-back ] bi ]
    [ write ] if ;

: clear-buffer ( buffer -- )
    [ items>> clear-deque ] [ 0 >>count drop ] bi ;
