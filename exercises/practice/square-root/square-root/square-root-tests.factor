USING: exercism-tools io kernel square-root tools.test unicode ;
IN: square-root.tests

"Square Root:" print

"root of 1" print
{ 1 } [ 1 square-root ] unit-test

STOP-HERE

"root of 4" print
{ 2 } [ 4 square-root ] unit-test

"root of 25" print
{ 5 } [ 25 square-root ] unit-test

"root of 81" print
{ 9 } [ 81 square-root ] unit-test

"root of 196" print
{ 14 } [ 196 square-root ] unit-test

"root of 65025" print
{ 255 } [ 65025 square-root ] unit-test

"root of 4905601600" print
{ 70040 } [ 4905601600 square-root ] unit-test
