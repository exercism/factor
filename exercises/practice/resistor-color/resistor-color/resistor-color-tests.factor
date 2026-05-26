USING: exercism-tools io kernel resistor-color tools.test unicode ;
IN: resistor-color.tests

"Black" description
{ 0 } [ "black" color>code ] unit-test

STOP-HERE

"White" description
{ 9 } [ "white" color>code ] unit-test

"Orange" description
{ 3 } [ "orange" color>code ] unit-test

"Colors" description
{ { "black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white" } }
[ colors ] unit-test
