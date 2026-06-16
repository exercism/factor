USING: kernel ;
IN: simple-linked-list

ERROR: list-empty ;

! Define `linked-list-node` and `linked-list` tuples, then implement
! these words. Also add `M: linked-list length` (from `sequences`) so
! the tests can call `length` on your list.

: <linked-list> ( -- linked-list )
    "unimplemented" throw ;

: >linked-list ( seq -- linked-list )
    "unimplemented" throw ;

: linked-list>array ( linked-list -- array )
    "unimplemented" throw ;

: list-push ( linked-list value -- linked-list )
    "unimplemented" throw ;

: list-pop ( linked-list -- linked-list value )
    "unimplemented" throw ;

: list-peek ( linked-list -- value )
    "unimplemented" throw ;

: list-reverse ( linked-list -- linked-list )
    "unimplemented" throw ;
