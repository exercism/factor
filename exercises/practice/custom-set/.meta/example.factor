USING: accessors arrays kernel sequences sets vectors ;
IN: custom-set

TUPLE: custom-set { items vector } ;
INSTANCE: custom-set set

: <custom-set> ( -- set ) V{ } clone custom-set boa ;

: >custom-set ( seq -- set )
    [ <custom-set> ] dip [ over adjoin ] each ;

M: custom-set members
    items>> >array ;

M: custom-set in?
    items>> member? ;

M: custom-set adjoin
    2dup in? [ 2drop ] [ items>> push ] if ;

M: custom-set set-like
    drop dup custom-set? [ members >custom-set ] unless ;
