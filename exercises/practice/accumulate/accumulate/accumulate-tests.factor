USING: accumulate io kernel lexer tools.test unicode ;
IN: accumulate.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Accumulate:" print

"accumulate empty" print
{ { } }
[ { } [ dup * ] accum ] unit-test

STOP-HERE

"accumulate squares" print
{ { 1 4 9 } }
[ { 1 2 3 } [ dup * ] accum ] unit-test

"accumulate upcases" print
{ { "HELLO" "WORLD" } }
[ { "Hello" "world" } [ >upper ] accum ] unit-test

"accumulate reversed strings" print
{ { "eht" "kciuq" "nworb" "xof" "cte" } }
[ { "the" "quick" "brown" "fox" "etc" } [ string-reverse ] accum ] unit-test
