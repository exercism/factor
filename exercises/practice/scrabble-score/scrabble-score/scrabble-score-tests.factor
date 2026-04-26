USING: io kernel lexer scrabble-score tools.test unicode ;
IN: scrabble-score.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Scrabble Score:" print

"lowercase letter" print
{ 1 }
[ "a" score ] unit-test

STOP-HERE

"uppercase letter" print
{ 1 }
[ "A" score ] unit-test

"valuable letter" print
{ 4 }
[ "f" score ] unit-test

"short word" print
{ 2 }
[ "at" score ] unit-test

"short, valuable word" print
{ 12 }
[ "zoo" score ] unit-test

"medium word" print
{ 6 }
[ "street" score ] unit-test

"medium, valuable word" print
{ 22 }
[ "quirky" score ] unit-test

"long, mixed-case word" print
{ 41 }
[ "OxyphenButazone" score ] unit-test

"english-like word" print
{ 8 }
[ "pinata" score ] unit-test

"empty input" print
{ 0 }
[ "" score ] unit-test

"entire alphabet available" print
{ 87 }
[ "abcdefghijklmnopqrstuvwxyz" score ] unit-test
