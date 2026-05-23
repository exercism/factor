USING: accessors boatswains-bilge continuations destructors
       exercism-tools kernel tools.test ;
IN: boatswains-bilge.tests

! A small disposable fixture for tasks 1-4. Task 5 has the student
! build their own from scratch.
TUPLE: test-pump < disposable opened ;
: <test-pump> ( -- pump ) test-pump new-disposable t >>opened ;
M: test-pump dispose* f >>opened drop ;

TASK: 1 drain-bilge
{ f } [ <test-pump> dup drain-bilge opened>> ] unit-test

STOP-HERE

! dispose is idempotent — calling drain-bilge twice is harmless
{ f } [ <test-pump> dup dup drain-bilge drain-bilge opened>> ] unit-test

TASK: 2 pump-out
{ f } [ <test-pump> dup [ drop ] pump-out opened>> ] unit-test

! the quotation receives the pump as an argument
{ "checked" } [
    <test-pump> [ opened>> "checked" "open" ? ] pump-out
] unit-test

TASK: 3 shift-routine
{ f f } [
    <test-pump> <test-pump>
    2dup [ 2drop ] shift-routine
    [ opened>> ] bi@
] unit-test

! quotation runs with both pumps on stack
{ "checked" } [
    <test-pump> <test-pump>
    [ 2drop "checked" ] shift-routine
] unit-test

TASK: 4 risky-pump-out
! quotation succeeds — pump stays open (|dispose is failure-only)
{ t } [ <test-pump> dup [ drop ] risky-pump-out opened>> ] unit-test

! quotation throws — pump is disposed and the throw propagates
{ f } [
    <test-pump> dup
    [ [ drop "boom" throw ] risky-pump-out ] [ drop ] recover
    drop opened>>
] unit-test

TASK: 5 valve
{ t } [ <valve> is-open>> ] unit-test
{ f } [ <valve> dup dispose is-open>> ] unit-test

! disposing twice is harmless — the framework runs dispose* at most once
{ f } [ <valve> dup dispose dup dispose is-open>> ] unit-test
