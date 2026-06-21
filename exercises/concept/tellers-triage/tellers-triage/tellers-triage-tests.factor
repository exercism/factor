USING: exercism-tools kernel tellers-triage tools.test ;
IN: tellers-triage.tests

TASK: 1 new-queue
{ { } } [ new-queue serve-all ] unit-test

STOP-HERE

TASK: 2 join-queue
{ { "alice" } } [ new-queue "alice" 5 rot join-queue serve-all ] unit-test
{ "bob" } [ new-queue "alice" 5 rot join-queue "bob" 2 rot join-queue next-name ] unit-test

TASK: 3 next-name
{ "bob" } [ new-queue "alice" 5 rot join-queue "bob" 2 rot join-queue
            "carol" 9 rot join-queue next-name ] unit-test
{ "alice" } [ new-queue "alice" 5 rot join-queue next-name ] unit-test

TASK: 4 serve-all
{ { "bob" "alice" "carol" } } [ new-queue "alice" 5 rot join-queue "bob" 2 rot join-queue
                                "carol" 9 rot join-queue serve-all ] unit-test
{ { } } [ new-queue serve-all ] unit-test
{ { "bob" "alice" } } [ new-queue "alice" 5 rot join-queue "bob" 2 rot join-queue serve-all ] unit-test
