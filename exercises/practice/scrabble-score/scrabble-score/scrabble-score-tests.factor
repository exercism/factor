USING: exercism-tools io kernel scrabble-score tools.test unicode ;
IN: scrabble-score.tests

"lowercase letter" description
{ 1 }
[ "a" score ] unit-test

STOP-HERE

"uppercase letter" description
{ 1 }
[ "A" score ] unit-test

"valuable letter" description
{ 4 }
[ "f" score ] unit-test

"short word" description
{ 2 }
[ "at" score ] unit-test

"short, valuable word" description
{ 12 }
[ "zoo" score ] unit-test

"medium word" description
{ 6 }
[ "street" score ] unit-test

"medium, valuable word" description
{ 22 }
[ "quirky" score ] unit-test

"long, mixed-case word" description
{ 41 }
[ "OxyphenButazone" score ] unit-test

"english-like word" description
{ 8 }
[ "pinata" score ] unit-test

"empty input" description
{ 0 }
[ "" score ] unit-test

"entire alphabet available" description
{ 87 }
[ "abcdefghijklmnopqrstuvwxyz" score ] unit-test
