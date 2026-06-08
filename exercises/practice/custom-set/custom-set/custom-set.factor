USING: kernel ;
IN: custom-set

! Define a `custom-set` tuple and declare it an instance of the
! `set` mixin with `INSTANCE: custom-set set`.

! Add `M: custom-set` methods for `members`, `in?`, `adjoin`,
! and `set-like` so that `null?`, `union`, `intersect`, `diff`,
! `subset?`, `set=`, and `intersects?` from the `sets` vocab work
! on your set automatically.

! Implement the words below.

: <custom-set> ( -- set )
    "unimplemented" throw ;

: >custom-set ( seq -- set )
    "unimplemented" throw ;
