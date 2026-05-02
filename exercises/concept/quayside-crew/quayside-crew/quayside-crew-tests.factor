USING: accessors arrays exercism-tools kernel math quayside-crew sequences tools.test ;
IN: quayside-crew.tests

TASK: 1 weigh-crate
{ 35 } [ { 12 8 15 } weigh-crate ] unit-test

STOP-HERE

{ 0 }  [ { } weigh-crate ] unit-test
{ 7 }  [ { 7 } weigh-crate ] unit-test

TASK: 2 weigh-all
{ { 10 10 12 } } [ { { 5 5 } { 10 } { 3 4 5 } } weigh-all ] unit-test
{ { } }          [ { } weigh-all ] unit-test
{ { 35 } }       [ { { 12 8 15 } } weigh-all ] unit-test

TASK: 3 <crane>
{ 0 } [ <crane> tonnage>> ] unit-test

! a fresh crane each call — mutating one doesn't affect another
{ 5 0 } [
    <crane> dup 5 swap hoist-crate tonnage>>
    <crane> tonnage>>
] unit-test

TASK: 4 hoist-crate
{ 35 } [ <crane> dup 35 swap hoist-crate tonnage>> ] unit-test
{ 52 }
[
    <crane>
    dup 35 swap hoist-crate
    dup 17 swap hoist-crate
    tonnage>>
] unit-test

TASK: 5 crane-tonnage
{ 0 }  [ <crane> crane-tonnage ] unit-test
{ 35 } [ <crane> dup 35 swap hoist-crate crane-tonnage ] unit-test

TASK: 6 load-cargo
{ 32 } [
    <crane>
    { { 5 5 } { 10 } { 3 4 5 } } over load-cargo
    crane-tonnage
] unit-test

{ 0 } [
    <crane>
    { } over load-cargo
    crane-tonnage
] unit-test

! many crates — verifies the lock prevents lost updates
{ 5050 } [
    <crane>
    100 <iota> [ 1 + 1array ] map
    over load-cargo
    crane-tonnage
] unit-test
