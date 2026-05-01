USING: collatz-conjecture exercism-tools io kernel tools.test unicode ;
IN: collatz-conjecture.tests

"Collatz Conjecture:" print

"zero steps for one" print
{ 0 } [ 1 steps ] unit-test

STOP-HERE

"divide if even" print
{ 4 } [ 16 steps ] unit-test

"even and odd steps" print
{ 9 } [ 12 steps ] unit-test

"large number of even and odd steps" print
{ 152 } [ 1000000 steps ] unit-test

"zero is an error" print
[ 0 steps ] [ "Only positive integers are allowed" = ] must-fail-with

"negative value is an error" print
[ -15 steps ] [ "Only positive integers are allowed" = ] must-fail-with

"large positive" print
{ 817 } [ 2037066081 steps ] unit-test
