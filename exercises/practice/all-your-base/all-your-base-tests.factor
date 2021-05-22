USING: all-your-base io kernel math sequences tools.test unicode ;
IN: all-your-base.tests

"All Your Base:" print

"single bit one to decimal" print
{ { 1 } } [ { 1 } 2 10 rebase ] unit-test

"binary to single decimal" print
{ { 5 } } [ { 1 0 1 } 2 10 rebase ] unit-test

"single decimal to binary" print
{ { 1 0 1 } } [ { 5 } 10 2 rebase ] unit-test

"binary to multiple decimal" print
{ { 4 2 } } [ { 1 0 1 0 1 0 } 2 10 rebase ] unit-test

"decimal to binary" print
{ { 1 0 1 0 1 0 } } [ { 4 2 } 10 2 rebase ] unit-test

"trinary to hexadecimal" print
{ { 2 10 } } [ { 1 1 2 0 } 3 16 rebase ] unit-test

"hexadecimal to trinary" print
{ { 1 1 2 0 } } [ { 2 10 } 16 3 rebase ] unit-test

"15-bit integer" print
{ { 6 10 45 } } [ { 3 46 60 } 97 73 rebase ] unit-test

"empty list" print
{ { 0 } } [ { } 2 10 rebase ] unit-test

"single zero" print
{ { 0 } } [ { 0 } 10 2 rebase ] unit-test

"multiple zeros" print
{ { 0 } } [ { 0 0 0 } 10 2 rebase ] unit-test

"leading zeros" print
{ { 4 2 } } [ { 0 6 0 } 7 10 rebase ] unit-test

"input base is one" print
[ { 0 } 1 10 rebase ] [ "input base must be >= 2" ] must-fail-with

"input base is zero" print
[ { } 0 10 rebase ] [ "input base must be >= 2" ] must-fail-with

"input base is negative" print
[ { 1 } -2 10 rebase ] [ "input base must be >= 2" ] must-fail-with

"negative digit" print
[ { 1 -1 1 0 1 0 } 2 10 rebase ] [
    "all digits must satisfy 0 <= d < input base"
] must-fail-with

"invalid positive digit" print
[ { 1 2 1 0 1 0 } 2 10 rebase ] [
    "all digits must satisfy 0 <= d < input base"
] must-fail-with

"output base is one" print
[ { 1 0 1 0 1 0 } 2 1 rebase ] [ "output base must be >= 2" ] must-fail-with

"output base is zero" print
[ { 7 } 10 0 rebase ] [ "output base must be >= 2" ] must-fail-with

"output base is negative" print
[ { 1 } 2 -7 rebase ] [ "output base must be >= 2" ] must-fail-with

"both bases are negative" print
[ { 1 } -2 -7 rebase ] [ "input base must be >= 2" ] must-fail-with

