USING: kernel ;
IN: dragons-descendants

! Task 1: define the dragon tuple hierarchy here (dragon and its
! descendants fire-dragon, ice-dragon, volcano-dragon — see the
! instructions for each class's slots), then the <dragon> constructor
! below. The descendant constructors follow in tasks 2-4.

: <dragon> ( name color age -- dragon )
    "unimplemented" throw ;

: <fire-dragon> ( name color age flame-temp -- fd )
    "unimplemented" throw ;

: <ice-dragon> ( name color age chill-temp -- id )
    "unimplemented" throw ;

: <volcano-dragon> ( name color age flame-temp lava-volume -- vd )
    "unimplemented" throw ;

: age-dragon ( dragon -- )
    "unimplemented" throw ;
