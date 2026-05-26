USING: exercism-tools io kernel perfect-numbers tools.test unicode ;
IN: perfect-numbers.tests

"Smallest perfect number is classified correctly" description
{ "perfect" } [ 6 classify ] unit-test

STOP-HERE

"Medium perfect number is classified correctly" description
{ "perfect" } [ 28 classify ] unit-test

"Large perfect number is classified correctly" description
{ "perfect" } [ 33550336 classify ] unit-test

"Smallest abundant number is classified correctly" description
{ "abundant" } [ 12 classify ] unit-test

"Medium abundant number is classified correctly" description
{ "abundant" } [ 30 classify ] unit-test

"Large abundant number is classified correctly" description
{ "abundant" } [ 33550335 classify ] unit-test

"Perfect square abundant number is classified correctly" description
{ "abundant" } [ 196 classify ] unit-test

"Smallest prime deficient number is classified correctly" description
{ "deficient" } [ 2 classify ] unit-test

"Smallest non-prime deficient number is classified correctly" description
{ "deficient" } [ 4 classify ] unit-test

"Medium deficient number is classified correctly" description
{ "deficient" } [ 32 classify ] unit-test

"Large deficient number is classified correctly" description
{ "deficient" } [ 33550337 classify ] unit-test

"Edge case (no factors other than itself) is classified correctly" description
{ "deficient" } [ 1 classify ] unit-test

"Zero is rejected (as it is not a positive integer)" description
[ 0 classify ] [ "Classification is only possible for positive integers." = ] must-fail-with

"Negative integer is rejected (as it is not a positive integer)" description
[ -1 classify ] [ "Classification is only possible for positive integers." = ] must-fail-with

"Large deficient number with repeated prime factor is classified correctly" description
{ "deficient" } [ 8796027459974431 classify ] unit-test
