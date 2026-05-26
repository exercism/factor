USING: exercism-tools io kernel square-root tools.test unicode ;
IN: square-root.tests

"root of 1" description
{ 1 } [ 1 square-root ] unit-test

STOP-HERE

"root of 4" description
{ 2 } [ 4 square-root ] unit-test

"root of 25" description
{ 5 } [ 25 square-root ] unit-test

"root of 81" description
{ 9 } [ 81 square-root ] unit-test

"root of 196" description
{ 14 } [ 196 square-root ] unit-test

"root of 65025" description
{ 255 } [ 65025 square-root ] unit-test

"root of 4905601600" description
{ 70040 } [ 4905601600 square-root ] unit-test
