USING: accumulate exercism-tools io kernel math tools.test unicode ;
IN: accumulate.tests

"accumulate empty" description
{ { } }
[ { } [ dup * ] accum ] unit-test

STOP-HERE

"accumulate squares" description
{ { 1 4 9 } }
[ { 1 2 3 } [ dup * ] accum ] unit-test

"accumulate upcases" description
{ { "HELLO" "WORLD" } }
[ { "Hello" "world" } [ >upper ] accum ] unit-test

"accumulate reversed strings" description
{ { "eht" "kciuq" "nworb" "xof" "cte" } }
[ { "the" "quick" "brown" "fox" "etc" } [ string-reverse ] accum ] unit-test
