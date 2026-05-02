USING: kernel ;
IN: simple-linked-list

ERROR: list-empty ;

! Define a `linked-list` tuple and implement these words. Then add
! `M: linked-list length` and `M: linked-list nth-unsafe` so the
! tests can call `length` and `>array` on your list.

: <linked-list> ( -- linked-list )
    "unimplemented" throw ;

: >linked-list ( seq -- linked-list )
    "unimplemented" throw ;

: list-push ( linked-list value -- linked-list )
    "unimplemented" throw ;

: list-pop ( linked-list -- linked-list value )
    "unimplemented" throw ;

: list-peek ( linked-list -- value )
    "unimplemented" throw ;

: list-reverse ( linked-list -- linked-list )
    "unimplemented" throw ;
