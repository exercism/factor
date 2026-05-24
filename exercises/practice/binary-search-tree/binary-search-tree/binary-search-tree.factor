USING: kernel ;
IN: binary-search-tree

TUPLE: bst ;
TUPLE: leaf < bst ;
TUPLE: branch < bst data left right ;

: <bst> ( data-seq -- tree )
    "unimplemented" throw ;

GENERIC: sorted-data ( tree -- seq )
