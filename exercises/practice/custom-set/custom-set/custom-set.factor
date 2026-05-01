USING: kernel ;
IN: custom-set

! Define a `custom-set` tuple and implement the words below. Then
! add `M: custom-set` methods for `members`, `in?`, `adjoin`, and
! `set-like` so that `null?`, `union`, `intersect`, `diff`,
! `subset?`, `set=`, and `intersects?` from the `sets` vocab work
! on your set automatically.

: <custom-set> ( -- set )
    "unimplemented" throw ;

: >custom-set ( seq -- set )
    "unimplemented" throw ;
