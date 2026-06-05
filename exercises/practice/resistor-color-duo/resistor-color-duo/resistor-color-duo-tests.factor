USING: exercism-tools io kernel resistor-color-duo tools.test unicode ;
IN: resistor-color-duo.tests

"Brown and black" description
{ 10 }
[ { "brown" "black" } value ] unit-test

STOP-HERE

"Blue and grey" description
{ 68 }
[ { "blue" "grey" } value ] unit-test

"Yellow and violet" description
{ 47 }
[ { "yellow" "violet" } value ] unit-test

"White and red" description
{ 92 }
[ { "white" "red" } value ] unit-test

"Orange and orange" description
{ 33 }
[ { "orange" "orange" } value ] unit-test

"Ignore additional colors" description
{ 51 }
[ { "green" "brown" "orange" } value ] unit-test

"Black and brown, one-digit" description
{ 1 }
[ { "black" "brown" } value ] unit-test
