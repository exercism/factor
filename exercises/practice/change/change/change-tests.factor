USING: change exercism-tools io kernel tools.test unicode ;
IN: change.tests

"change for 1 cent" description
{ { 1 } }
[ HS{ 1 5 10 25 } 1 find-fewest-coins ] unit-test

STOP-HERE

"single coin change" description
{ { 25 } }
[ HS{ 1 5 10 25 100 } 25 find-fewest-coins ] unit-test

"multiple coin change" description
{ { 5 10 } }
[ HS{ 1 5 10 25 100 } 15 find-fewest-coins ] unit-test

"change with Lilliputian Coins" description
{ { 4 4 15 } }
[ HS{ 1 4 15 20 50 } 23 find-fewest-coins ] unit-test

"change with Lower Elbonia Coins" description
{ { 21 21 21 } }
[ HS{ 1 5 10 21 25 } 63 find-fewest-coins ] unit-test

"large target values" description
{ { 2 2 5 20 20 50 100 100 100 100 100 100 100 100 100 } }
[ HS{ 1 2 5 10 20 50 100 } 999 find-fewest-coins ] unit-test

"possible change without unit coins available" description
{ { 2 2 2 5 10 } }
[ HS{ 2 5 10 20 50 } 21 find-fewest-coins ] unit-test

"another possible change without unit coins available" description
{ { 4 4 4 5 5 5 } }
[ HS{ 4 5 } 27 find-fewest-coins ] unit-test

"a greedy approach is not optimal" description
{ { 10 10 } }
[ HS{ 1 10 11 } 20 find-fewest-coins ] unit-test

"no coins make 0 change" description
{ { } }
[ HS{ 1 5 10 21 25 } 0 find-fewest-coins ] unit-test

"error testing for change smaller than the smallest of coins" description
[ HS{ 5 10 } 3 find-fewest-coins ] [ cannot-make-change? ] must-fail-with

"error if no combination can add up to target" description
[ HS{ 5 10 } 94 find-fewest-coins ] [ cannot-make-change? ] must-fail-with

"cannot find negative change values" description
[ HS{ 1 2 5 } -5 find-fewest-coins ] [ cannot-make-change? ] must-fail-with

"no combination of 6, 9, and 20 can make 43" description
[ HS{ 6 9 20 } 43 find-fewest-coins ] [ cannot-make-change? ] must-fail-with
