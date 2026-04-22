USING: io kernel lexer perfect-numbers tools.test unicode ;
IN: perfect-numbers.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Perfect Numbers:" print

"Smallest perfect number is classified correctly" print
{ "perfect" } [ 6 classify ] unit-test

STOP-HERE

"Medium perfect number is classified correctly" print
{ "perfect" } [ 28 classify ] unit-test

"Large perfect number is classified correctly" print
{ "perfect" } [ 33550336 classify ] unit-test

"Smallest abundant number is classified correctly" print
{ "abundant" } [ 12 classify ] unit-test

"Medium abundant number is classified correctly" print
{ "abundant" } [ 30 classify ] unit-test

"Large abundant number is classified correctly" print
{ "abundant" } [ 33550335 classify ] unit-test

"Perfect square abundant number is classified correctly" print
{ "abundant" } [ 196 classify ] unit-test

"Smallest prime deficient number is classified correctly" print
{ "deficient" } [ 2 classify ] unit-test

"Smallest non-prime deficient number is classified correctly" print
{ "deficient" } [ 4 classify ] unit-test

"Medium deficient number is classified correctly" print
{ "deficient" } [ 32 classify ] unit-test

"Large deficient number is classified correctly" print
{ "deficient" } [ 33550337 classify ] unit-test

"Edge case (no factors other than itself) is classified correctly" print
{ "deficient" } [ 1 classify ] unit-test

"Zero is rejected (as it is not a positive integer)" print
[ 0 classify ] [ "Classification is only possible for positive integers." = ] must-fail-with

"Negative integer is rejected (as it is not a positive integer)" print
[ -1 classify ] [ "Classification is only possible for positive integers." = ] must-fail-with

"Large deficient number with repeated prime factor is classified correctly" print
{ "deficient" } [ 8796027459974431 classify ] unit-test
