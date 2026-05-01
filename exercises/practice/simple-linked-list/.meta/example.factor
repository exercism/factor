USING: accessors kernel make math sequences ;
IN: simple-linked-list

ERROR: list-empty ;

TUPLE: node value next ;
TUPLE: linked-list head ;

: <linked-list> ( -- linked-list ) linked-list new ;

: list-push ( linked-list value -- linked-list )
    over head>> node boa >>head ;

: ensure-non-empty ( linked-list -- linked-list )
    dup head>> [ list-empty ] unless ;

: list-peek ( linked-list -- value )
    ensure-non-empty head>> value>> ;

: list-pop ( linked-list -- linked-list value )
    ensure-non-empty
    [ head>> value>> ]
    [ dup head>> next>> >>head ] bi swap ;

M: linked-list length
    head>> 0 [ over ] [ [ next>> ] [ 1 + ] bi* ] while nip ;

: linked-list>array ( linked-list -- array )
    [ head>> [ dup ] [ [ value>> , ] [ next>> ] bi ] while drop ]
    { } make ;

: >linked-list ( seq -- linked-list )
    [ <linked-list> ] dip [ list-push ] each ;

: list-reverse ( linked-list -- linked-list )
    [ <linked-list> ] dip
    linked-list>array [ list-push ] each ;
