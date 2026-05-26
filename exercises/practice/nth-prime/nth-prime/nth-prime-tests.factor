USING: exercism-tools io kernel nth-prime tools.test unicode ;
IN: nth-prime.tests

"first prime" description
{ 2 }
[ 1 nth-prime ] unit-test

STOP-HERE

"second prime" description
{ 3 }
[ 2 nth-prime ] unit-test

"sixth prime" description
{ 13 }
[ 6 nth-prime ] unit-test

"big prime" description
{ 104743 }
[ 10001 nth-prime ] unit-test

"there is no zeroth prime" description
[ 0 nth-prime ]
[ "there is no zeroth prime" = ] must-fail-with

"seventh prime" description
{ 17 }
[ 7 nth-prime ] unit-test

"very big prime" description
{ 821647 }
[ 65537 nth-prime ] unit-test
