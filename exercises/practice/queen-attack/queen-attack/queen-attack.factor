USING: kernel ;
IN: queen-attack

ERROR: row-not-on-board ;
ERROR: column-not-on-board ;

: <queen> ( row column -- queen )
    "unimplemented" throw ;

: can-attack? ( queen1 queen2 -- ? )
    "unimplemented" throw ;
