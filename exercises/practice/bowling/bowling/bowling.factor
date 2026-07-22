USING: kernel ;
IN: bowling

! Define a `game` tuple to hold the rolls made so far, and any
! other state you need. `<game>` should return a new game with
! no rolls.

! `roll` records the number of pins knocked down, throwing when
! the roll is invalid or the game is already over.
! `score` returns the final score, throwing when the game is
! not yet complete.

: <game> ( -- game )
    "unimplemented" throw ;

: roll ( pins game -- )
    "unimplemented" throw ;

: score ( game -- n )
    "unimplemented" throw ;
