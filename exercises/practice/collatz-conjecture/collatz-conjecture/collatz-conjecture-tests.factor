USING: collatz-conjecture exercism-tools io kernel tools.test unicode ;
IN: collatz-conjecture.tests

"zero steps for one" description
{ 0 } [ 1 steps ] unit-test

STOP-HERE

"divide if even" description
{ 4 } [ 16 steps ] unit-test

"even and odd steps" description
{ 9 } [ 12 steps ] unit-test

"large number of even and odd steps" description
{ 152 } [ 1000000 steps ] unit-test

"zero is an error" description
[ 0 steps ] [ "Only positive integers are allowed" = ] must-fail-with

"negative value is an error" description
[ -15 steps ] [ "Only positive integers are allowed" = ] must-fail-with

"large positive" description
{ 817 } [ 2037066081 steps ] unit-test
