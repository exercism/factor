USING: exercism-tools io kernel secret-handshake tools.test unicode ;
IN: secret-handshake.tests

"wink for 1" description
{ { "wink" } }
[ 1 commands ] unit-test

STOP-HERE

"double blink for 10" description
{ { "double blink" } }
[ 2 commands ] unit-test

"close your eyes for 100" description
{ { "close your eyes" } }
[ 4 commands ] unit-test

"jump for 1000" description
{ { "jump" } }
[ 8 commands ] unit-test

"combine two actions" description
{ { "wink" "double blink" } }
[ 3 commands ] unit-test

"reverse two actions" description
{ { "double blink" "wink" } }
[ 19 commands ] unit-test

"reversing one action gives the same action" description
{ { "jump" } }
[ 24 commands ] unit-test

"reversing no actions still gives no actions" description
{ { } }
[ 16 commands ] unit-test

"all possible actions" description
{ { "wink" "double blink" "close your eyes" "jump" } }
[ 15 commands ] unit-test

"reverse all possible actions" description
{ { "jump" "close your eyes" "double blink" "wink" } }
[ 31 commands ] unit-test

"do nothing for zero" description
{ { } }
[ 0 commands ] unit-test
