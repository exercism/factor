USING: belgian-boxcars exercism-tools tools.test ;
IN: belgian-boxcars.tests

TASK: 1 couple
{ { { "coal" "coal" "coke" } { "ore" "ore" "timber" } { "timber" } } }
[ { "coal" "coal" "coke" "ore" "ore" "timber" "timber" } 3 couple ]
unit-test

{ { } } [ { } 3 couple ] unit-test

{ { { "a" "b" } { "c" "d" } } }
[ { "a" "b" "c" "d" } 2 couple ] unit-test

{ { { "a" } { "b" } { "c" } } }
[ { "a" "b" "c" } 1 couple ] unit-test

TASK: 2 peek-couplings
{ { { "coal" "ore" } { "ore" "timber" } { "timber" "crates" } } }
[ { "coal" "ore" "timber" "crates" } peek-couplings ] unit-test

{ { } } [ { } peek-couplings ] unit-test

{ { } } [ { "solo" } peek-couplings ] unit-test

{ { { "a" "b" } } } [ { "a" "b" } peek-couplings ] unit-test

TASK: 3 split-at-junctions
{ { { "coal" "coal" } { "ore" } { "timber" } } }
[ { "coal" "coal" "switch" "ore" "switch" "timber" }
  { "switch" } split-at-junctions ] unit-test

! multiple junction kinds
{ { { "coal" } { "ore" } { "timber" } } }
[ { "coal" "Y" "ore" "X" "timber" }
  { "X" "Y" } split-at-junctions ] unit-test

! no junctions present
{ { { "coal" "ore" "timber" } } }
[ { "coal" "ore" "timber" } { "switch" } split-at-junctions ] unit-test

{ { { } } }
[ { } { "switch" } split-at-junctions ] unit-test

! leading and trailing junctions produce empty legs at the edges
{ { { } { "coal" } { } } }
[ { "switch" "coal" "switch" } { "switch" } split-at-junctions ] unit-test

TASK: 4 coalesce-cargo
{ { { "coal" "coal" } { "ore" "ore" "ore" } { "timber" } { "coal" } } }
[ { "coal" "coal" "ore" "ore" "ore" "timber" "coal" } coalesce-cargo ]
unit-test

{ { } } [ { } coalesce-cargo ] unit-test

{ { { "solo" } } } [ { "solo" } coalesce-cargo ] unit-test

{ { { "a" } { "b" } { "a" } } }
[ { "a" "b" "a" } coalesce-cargo ] unit-test
