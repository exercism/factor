USING: exercism-tools heaps kernel tellers-triage tools.test ;
IN: tellers-triage.tests

TASK: 1 new-queue
{ t } [ new-queue heap-empty? ] unit-test

STOP-HERE

{ 0 } [ new-queue heap-size ] unit-test

TASK: 2 join-queue
{ 1 } [ new-queue "alice" 5 rot join-queue heap-size ] unit-test
! the customer and priority are stored together
{ "alice" 5 } [ new-queue "alice" 5 rot join-queue heap-peek ] unit-test
{ 2 } [ new-queue "alice" 5 rot join-queue "bob" 2 rot join-queue heap-size ] unit-test

TASK: 3 next-name
{ "bob" } [ new-queue "alice" 5 rot join-queue "bob" 2 rot join-queue
            "carol" 9 rot join-queue next-name ] unit-test
{ "alice" } [ new-queue "alice" 5 rot join-queue next-name ] unit-test

TASK: 4 serve-all
{ { "bob" "alice" "carol" } } [ new-queue "alice" 5 rot join-queue "bob" 2 rot join-queue
                                "carol" 9 rot join-queue serve-all ] unit-test
{ { } } [ new-queue serve-all ] unit-test
{ { "bob" "alice" } } [ new-queue "alice" 5 rot join-queue "bob" 2 rot join-queue serve-all ] unit-test
