USING: accumulate io kernel math sequences tools.test unicode ;
IN: accumulate.tests

"Accumulate:" print

"accumulate empty" print
{ { } } [ { } [ sq ] accum ] unit-test

"accumulate squares" print
{ { 1 4 9 } } [ { 1 2 3 } [ sq ] accum ] unit-test

"accumulate upcases" print
{ { "HELLO" "WORLD" } }
[ { "Hello" "world" } [ >upper ] accum ] unit-test

"accumulate reversed strings" print
{ { "eht" "kciuq" "nworb" "xof" "cte" } }
[ { "the" "quick" "brown" "fox" "etc" } [ string-reverse ] accum ] unit-test

"accumulate recursively" print
{ { { "a1" "a2" "a3" } { "b1" "b2" "b3" } { "c1" "c2" "c3" } } }
[ { "a" "b" "c" } [ dup dup { "1" "2" "3" } [ append ] accum ] accum ] unit-test

