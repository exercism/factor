USING: exercism-tools io kernel resistor-color-trio tools.test unicode ;
IN: resistor-color-trio.tests

"Orange and orange and black" description
{ "33 ohms" }
[ { "orange" "orange" "black" } label ] unit-test

STOP-HERE

"Blue and grey and brown" description
{ "680 ohms" }
[ { "blue" "grey" "brown" } label ] unit-test

"Red and black and red" description
{ "2 kiloohms" }
[ { "red" "black" "red" } label ] unit-test

"Green and brown and orange" description
{ "51 kiloohms" }
[ { "green" "brown" "orange" } label ] unit-test

"Yellow and violet and yellow" description
{ "470 kiloohms" }
[ { "yellow" "violet" "yellow" } label ] unit-test

"Blue and violet and blue" description
{ "67 megaohms" }
[ { "blue" "violet" "blue" } label ] unit-test

"Minimum possible value" description
{ "0 ohms" }
[ { "black" "black" "black" } label ] unit-test

"Maximum possible value" description
{ "99 gigaohms" }
[ { "white" "white" "white" } label ] unit-test

"First two colors make an invalid octal number" description
{ "8 ohms" }
[ { "black" "grey" "black" } label ] unit-test

"Ignore extra colors" description
{ "650 kiloohms" }
[ { "blue" "green" "yellow" "orange" } label ] unit-test

"Orange and orange and red" description
{ "3.3 kiloohms" }
[ { "orange" "orange" "red" } label ] unit-test

"Orange and orange and green" description
{ "3.3 megaohms" }
[ { "orange" "orange" "green" } label ] unit-test

"White and white and violet" description
{ "990 megaohms" }
[ { "white" "white" "violet" } label ] unit-test

"White and white and grey" description
{ "9.9 gigaohms" }
[ { "white" "white" "grey" } label ] unit-test
