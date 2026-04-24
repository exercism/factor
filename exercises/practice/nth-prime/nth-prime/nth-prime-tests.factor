USING: io kernel lexer nth-prime tools.test unicode ;
IN: nth-prime.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Nth Prime:" print

"first prime" print
{ 2 }
[ 1 nth-prime ] unit-test

STOP-HERE

"second prime" print
{ 3 }
[ 2 nth-prime ] unit-test

"sixth prime" print
{ 13 }
[ 6 nth-prime ] unit-test

"big prime" print
{ 104743 }
[ 10001 nth-prime ] unit-test

"there is no zeroth prime" print
[ 0 nth-prime ]
[ "there is no zeroth prime" = ] must-fail-with

"seventh prime" print
{ 17 }
[ 7 nth-prime ] unit-test

"very big prime" print
{ 821647 }
[ 65537 nth-prime ] unit-test
