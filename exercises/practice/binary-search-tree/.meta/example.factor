USING: accessors arrays generic kernel locals math.order sequences ;
IN: binary-search-tree

TUPLE: bst ;
TUPLE: leaf < bst ;
TUPLE: branch < bst data left right ;

: <leaf> ( -- leaf ) leaf new ;

: <branch> ( data -- branch )
    branch new swap >>data <leaf> >>left <leaf> >>right ;

GENERIC#: insert 1 ( tree data -- tree )

M: leaf insert nip <branch> ;

M:: branch insert ( tree data -- tree )
    data tree data>> before=? [
        tree dup left>> data insert >>left
    ] [
        tree dup right>> data insert >>right
    ] if ;

: <bst> ( data-seq -- tree )
    <leaf> [ insert ] reduce ;

GENERIC: sorted-data ( tree -- seq )

M: leaf sorted-data drop { } ;

M:: branch sorted-data ( tree -- seq )
    tree left>> sorted-data
    tree data>> 1array
    tree right>> sorted-data
    append append ;
