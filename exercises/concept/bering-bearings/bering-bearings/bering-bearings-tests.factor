USING: arrays bering-bearings exercism-tools kernel namespaces
tools.test ;
IN: bering-bearings.tests

TASK: 1 cartesian for cardinal
{ 0  1 } [ T{ cardinal { direction north } } >cartesian ] unit-test

STOP-HERE

{ 1  0 } [ T{ cardinal { direction east  } } >cartesian ] unit-test
{ 0 -1 } [ T{ cardinal { direction south } } >cartesian ] unit-test
{ -1 0 } [ T{ cardinal { direction west  } } >cartesian ] unit-test

TASK: 2 cartesian for polar
! Polar conversion goes through sin/cos so results are floats; use ~.
{ { 0.0 10.0 } 1e-9 }
[ T{ polar { magnitude 10 } { bearing 0 } } >cartesian 2array ] unit-test-v~

{ { 10.0 0.0 } 1e-9 }
[ T{ polar { magnitude 10 } { bearing 90 } } >cartesian 2array ] unit-test-v~

{ { 0.0 -10.0 } 1e-9 }
[ T{ polar { magnitude 10 } { bearing 180 } } >cartesian 2array ] unit-test-v~

{ { -10.0 0.0 } 1e-9 }
[ T{ polar { magnitude 10 } { bearing 270 } } >cartesian 2array ] unit-test-v~

{ { 100.0 0.0 } 1e-9 }
[ T{ polar { magnitude 100 } { bearing 90 } } >cartesian 2array ] unit-test-v~

TASK: 3 cartesian for relative
! With heading 0 (facing north), :ahead points north.
{ { 0.0 5.0 } 1e-9 } [
    0 heading [
        T{ relative { distance 5 } { bearing ahead } } >cartesian 2array
    ] with-variable
] unit-test-v~

! With heading 90 (facing east), :ahead points east.
{ { 5.0 0.0 } 1e-9 } [
    90 heading [
        T{ relative { distance 5 } { bearing ahead } } >cartesian 2array
    ] with-variable
] unit-test-v~

! With heading 0, :starboard points east.
{ { 5.0 0.0 } 1e-9 } [
    0 heading [
        T{ relative { distance 5 } { bearing starboard } } >cartesian 2array
    ] with-variable
] unit-test-v~

! With heading 90, :starboard points south.
{ { 0.0 -5.0 } 1e-9 } [
    90 heading [
        T{ relative { distance 5 } { bearing starboard } } >cartesian 2array
    ] with-variable
] unit-test-v~

TASK: 4 flip
{ T{ cardinal { direction south } } } [ T{ cardinal { direction north } } flip ] unit-test
{ T{ cardinal { direction west  } } } [ T{ cardinal { direction east  } } flip ] unit-test

{ T{ polar { magnitude 10 } { bearing 180 } } }
[ T{ polar { magnitude 10 } { bearing 0   } } flip ] unit-test

{ T{ polar { magnitude 10 } { bearing 0   } } }
[ T{ polar { magnitude 10 } { bearing 180 } } flip ] unit-test

{ T{ polar { magnitude 10 } { bearing 270 } } }
[ T{ polar { magnitude 10 } { bearing 90  } } flip ] unit-test

{ T{ relative { distance 5 } { bearing behind } } }
[ T{ relative { distance 5 } { bearing ahead } } flip ] unit-test

{ T{ relative { distance 5 } { bearing port } } }
[ T{ relative { distance 5 } { bearing starboard } } flip ] unit-test

TASK: 5 add-bearings
! Two cardinals: north + east = (1, 1) — exact integer math.
{ 1 1 }
[ T{ cardinal { direction north } } T{ cardinal { direction east } } add-bearings ]
unit-test

! cardinal + polar — polar pulls in floats, so use ~.
{ { 0.0 11.0 } 1e-9 }
[
    T{ cardinal { direction north } }
    T{ polar { magnitude 10 } { bearing 0 } }
    add-bearings 2array
]
unit-test-v~

! relative (heading 0, starboard, distance 5) + cardinal north
! → (5, 0) + (0, 1) = (5, 1).
{ { 5.0 1.0 } 1e-9 } [
    0 heading [
        T{ relative { distance 5 } { bearing starboard } }
        T{ cardinal { direction north } }
        add-bearings 2array
    ] with-variable
] unit-test-v~
