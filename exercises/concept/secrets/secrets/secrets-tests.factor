USING: exercism-tools secrets tools.test ;
IN: secrets.tests

TASK: 1 shift-back
{ 2 }         [ 8 2 shift-back ] unit-test

STOP-HERE

{ 268829204 } [ -2144333657 3 shift-back ] unit-test

TASK: 2 set-bits
{ 7 }     [ 5 3 set-bits ] unit-test
{ 30262 } [ 5652 26150 set-bits ] unit-test

TASK: 3 flip-bits
{ 14 }    [ 5 11 flip-bits ] unit-test
{ 43603 } [ 38460 15471 flip-bits ] unit-test

TASK: 4 clear-bits
{ 4 }  [ 5 11 clear-bits ] unit-test
{ 10 } [ 90 240 clear-bits ] unit-test
