USING: exercism-tools io kernel sublist tools.test unicode ;
IN: sublist.tests

"empty lists" description
{ equal }
[ {  } {  } relation ] unit-test

STOP-HERE

"empty list within non empty list" description
{ sublist }
[ {  } { 1 2 3 } relation ] unit-test

"non empty list contains empty list" description
{ superlist }
[ { 1 2 3 } {  } relation ] unit-test

"list equals itself" description
{ equal }
[ { 1 2 3 } { 1 2 3 } relation ] unit-test

"different lists" description
{ unequal }
[ { 1 2 3 } { 2 3 4 } relation ] unit-test

"false start" description
{ sublist }
[ { 1 2 5 } { 0 1 2 3 1 2 5 6 } relation ] unit-test

"consecutive" description
{ sublist }
[ { 1 1 2 } { 0 1 1 1 2 1 2 } relation ] unit-test

"sublist at start" description
{ sublist }
[ { 0 1 2 } { 0 1 2 3 4 5 } relation ] unit-test

"sublist in middle" description
{ sublist }
[ { 2 3 4 } { 0 1 2 3 4 5 } relation ] unit-test

"sublist at end" description
{ sublist }
[ { 3 4 5 } { 0 1 2 3 4 5 } relation ] unit-test

"at start of superlist" description
{ superlist }
[ { 0 1 2 3 4 5 } { 0 1 2 } relation ] unit-test

"in middle of superlist" description
{ superlist }
[ { 0 1 2 3 4 5 } { 2 3 } relation ] unit-test

"at end of superlist" description
{ superlist }
[ { 0 1 2 3 4 5 } { 3 4 5 } relation ] unit-test

"first list missing element from second list" description
{ unequal }
[ { 1 3 } { 1 2 3 } relation ] unit-test

"second list missing element from first list" description
{ unequal }
[ { 1 2 3 } { 1 3 } relation ] unit-test

"first list missing additional digits from second list" description
{ unequal }
[ { 1 2 } { 1 22 } relation ] unit-test

"order matters to a list" description
{ unequal }
[ { 1 2 3 } { 3 2 1 } relation ] unit-test

"same digits but different numbers" description
{ unequal }
[ { 1 0 1 } { 10 1 } relation ] unit-test
