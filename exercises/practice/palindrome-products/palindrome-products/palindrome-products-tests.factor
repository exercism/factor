USING: io kernel lexer palindrome-products tools.test unicode ;
IN: palindrome-products.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Palindrome Products:" print

"find the smallest palindrome from single digit factors" print
{ 1 { { 1 1 } } }
[ 1 9 smallest ] unit-test

STOP-HERE

"find the largest palindrome from single digit factors" print
{ 9 { { 1 9 } { 3 3 } } }
[ 1 9 largest ] unit-test

"find the smallest palindrome from double digit factors" print
{ 121 { { 11 11 } } }
[ 10 99 smallest ] unit-test

"find the largest palindrome from double digit factors" print
{ 9009 { { 91 99 } } }
[ 10 99 largest ] unit-test

"find the smallest palindrome from triple digit factors" print
{ 10201 { { 101 101 } } }
[ 100 999 smallest ] unit-test

"find the largest palindrome from triple digit factors" print
{ 906609 { { 913 993 } } }
[ 100 999 largest ] unit-test

"find the smallest palindrome from four digit factors" print
{ 1002001 { { 1001 1001 } } }
[ 1000 9999 smallest ] unit-test

"find the largest palindrome from four digit factors" print
{ 99000099 { { 9901 9999 } } }
[ 1000 9999 largest ] unit-test

"empty result for smallest if no palindrome in the range" print
{ f {  } }
[ 1002 1003 smallest ] unit-test

"empty result for largest if no palindrome in the range" print
{ f {  } }
[ 15 15 largest ] unit-test

"error result for smallest if min is more than max" print
[ 10000 1 smallest ]
[ "min must be <= max" = ] must-fail-with

"error result for largest if min is more than max" print
[ 2 1 largest ]
[ "min must be <= max" = ] must-fail-with

"smallest product does not use the smallest factor" print
{ 10988901 { { 3297 3333 } } }
[ 3215 4000 smallest ] unit-test

"find the smallest palindrome from six digit factors" print
{ 50067176005 { { 223619 223895 } } }
[ 223617 244818 smallest ] unit-test

"find the largest palindrome from six digit factors" print
{ 59842824895 { { 244445 244811 } } }
[ 223617 244818 largest ] unit-test
