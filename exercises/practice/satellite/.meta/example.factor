USING: kernel locals math sequences sets sorting ;
IN: satellite

TUPLE: tree value left right ;

ERROR: invalid-traversals ;

:: build ( preorder inorder -- tree )
    preorder empty? [ f ] [
        preorder first :> root
        inorder [ root = ] find drop :> idx
        preorder rest idx head
        inorder idx head
        build :> left
        preorder rest idx tail
        inorder idx 1 + tail
        build :> right
        root left right tree boa
    ] if ;

:: tree-from-traversals ( preorder inorder -- tree )
    preorder length inorder length = [ invalid-traversals ] unless
    preorder all-unique? [ invalid-traversals ] unless
    preorder sort inorder sort = [ invalid-traversals ] unless
    preorder inorder build ;
