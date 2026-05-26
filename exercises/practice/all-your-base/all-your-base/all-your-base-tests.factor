USING: all-your-base exercism-tools io kernel tools.test unicode ;
IN: all-your-base.tests

"single bit one to decimal" description
{ { 1 } }
[ { 1 } 2 10 rebase ] unit-test

STOP-HERE

"binary to single decimal" description
{ { 5 } }
[ { 1 0 1 } 2 10 rebase ] unit-test

"single decimal to binary" description
{ { 1 0 1 } }
[ { 5 } 10 2 rebase ] unit-test

"binary to multiple decimal" description
{ { 4 2 } }
[ { 1 0 1 0 1 0 } 2 10 rebase ] unit-test

"decimal to binary" description
{ { 1 0 1 0 1 0 } }
[ { 4 2 } 10 2 rebase ] unit-test

"trinary to hexadecimal" description
{ { 2 10 } }
[ { 1 1 2 0 } 3 16 rebase ] unit-test

"hexadecimal to trinary" description
{ { 1 1 2 0 } }
[ { 2 10 } 16 3 rebase ] unit-test

"15-bit integer" description
{ { 6 10 45 } }
[ { 3 46 60 } 97 73 rebase ] unit-test

"empty list" description
{ { 0 } }
[ {  } 2 10 rebase ] unit-test

"single zero" description
{ { 0 } }
[ { 0 } 10 2 rebase ] unit-test

"multiple zeros" description
{ { 0 } }
[ { 0 0 0 } 10 2 rebase ] unit-test

"leading zeros" description
{ { 4 2 } }
[ { 0 6 0 } 7 10 rebase ] unit-test

"input base is one" description
[ { 0 } 1 10 rebase ]
[ "input base must be >= 2" = ] must-fail-with

"input base is zero" description
[ {  } 0 10 rebase ]
[ "input base must be >= 2" = ] must-fail-with

"input base is negative" description
[ { 1 } -2 10 rebase ]
[ "input base must be >= 2" = ] must-fail-with

"negative digit" description
[ { 1 -1 1 0 1 0 } 2 10 rebase ]
[ "all digits must satisfy 0 <= d < input base" = ] must-fail-with

"invalid positive digit" description
[ { 1 2 1 0 1 0 } 2 10 rebase ]
[ "all digits must satisfy 0 <= d < input base" = ] must-fail-with

"output base is one" description
[ { 1 0 1 0 1 0 } 2 1 rebase ]
[ "output base must be >= 2" = ] must-fail-with

"output base is zero" description
[ { 7 } 10 0 rebase ]
[ "output base must be >= 2" = ] must-fail-with

"output base is negative" description
[ { 1 } 2 -7 rebase ]
[ "output base must be >= 2" = ] must-fail-with

"both bases are negative" description
[ { 1 } -2 -7 rebase ]
[ "input base must be >= 2" = ] must-fail-with
