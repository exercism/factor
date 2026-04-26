USING: kernel ;
IN: robot-simulator

! Declare a symbol per direction (north, east, south, west) and a
! `robot` tuple so the tests can refer to them by name.

: <robot> ( x y direction -- robot )
    "unimplemented" throw ;

: move ( robot instructions -- robot )
    "unimplemented" throw ;
