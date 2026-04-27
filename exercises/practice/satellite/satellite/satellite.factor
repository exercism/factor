USING: kernel ;
IN: satellite

TUPLE: tree value left right ;

ERROR: invalid-traversals ;

: tree-from-traversals ( preorder inorder -- tree )
    "unimplemented" throw ;
