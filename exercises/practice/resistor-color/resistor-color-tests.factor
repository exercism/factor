USING: io kernel resistor-color tools.test ;
IN: resistor-color.tests

"Resistor Color:" print

"Color codes" print
"Black" print
{ 0 } [ "black" color>code ] unit-test

"White" print
{ 9 } [ "white" color>code ] unit-test

"Orange" print
{ 3 } [ "orange" color>code ] unit-test

"Colors" print
{ { "black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white" } }
[ colors ] unit-test

