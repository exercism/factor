USING: exercism-tools grains io kernel tools.test unicode ;
IN: grains.tests

"Grains:" print

"grains on square 1" print
{ 1 } [ 1 square ] unit-test

STOP-HERE

"grains on square 2" print
{ 2 } [ 2 square ] unit-test

"grains on square 3" print
{ 4 } [ 3 square ] unit-test

"grains on square 4" print
{ 8 } [ 4 square ] unit-test

"grains on square 16" print
{ 32768 } [ 16 square ] unit-test

"grains on square 32" print
{ 2147483648 } [ 32 square ] unit-test

"grains on square 64" print
{ 9223372036854775808 } [ 64 square ] unit-test

"square 0 is invalid" print
[ 0 square ] [ "square must be between 1 and 64" = ] must-fail-with

"negative square is invalid" print
[ -1 square ] [ "square must be between 1 and 64" = ] must-fail-with

"square greater than 64 is invalid" print
[ 65 square ] [ "square must be between 1 and 64" = ] must-fail-with

"returns the total number of grains on the board" print
{ 18446744073709551615 } [ total ] unit-test
