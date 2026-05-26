USING: exercism-tools grains io kernel tools.test unicode ;
IN: grains.tests

"grains on square 1" description
{ 1 } [ 1 square ] unit-test

STOP-HERE

"grains on square 2" description
{ 2 } [ 2 square ] unit-test

"grains on square 3" description
{ 4 } [ 3 square ] unit-test

"grains on square 4" description
{ 8 } [ 4 square ] unit-test

"grains on square 16" description
{ 32768 } [ 16 square ] unit-test

"grains on square 32" description
{ 2147483648 } [ 32 square ] unit-test

"grains on square 64" description
{ 9223372036854775808 } [ 64 square ] unit-test

"square 0 is invalid" description
[ 0 square ] [ "square must be between 1 and 64" = ] must-fail-with

"negative square is invalid" description
[ -1 square ] [ "square must be between 1 and 64" = ] must-fail-with

"square greater than 64 is invalid" description
[ 65 square ] [ "square must be between 1 and 64" = ] must-fail-with

"returns the total number of grains on the board" description
{ 18446744073709551615 } [ total ] unit-test
