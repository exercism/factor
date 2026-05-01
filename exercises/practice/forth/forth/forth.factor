USING: kernel ;
IN: forth

! Implement `evaluate ( instructions -- stack )` which runs a
! sequence of Forth instruction strings and returns the final
! stack as an array.
!
! Use a separate `forth.builtins` vocabulary (in
! `forth/builtins/builtins.factor`) for the primitive
! operations: arithmetic (`+`, `-`, `*`, `/`) and stack
! manipulation (`dup`, `drop`, `swap`, `over`). Import that
! vocabulary here and dispatch on the parsed tokens.

: evaluate ( instructions -- stack ) "unimplemented" throw ;
