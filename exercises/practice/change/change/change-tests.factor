USING: change io kernel lexer tools.test unicode ;
IN: change.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Change:" print

"change for 1 cent" print
{ { 1 } }
[ HS{ 1 5 10 25 } 1 find-fewest-coins ] unit-test

STOP-HERE

"single coin change" print
{ { 25 } }
[ HS{ 1 5 10 25 100 } 25 find-fewest-coins ] unit-test

"multiple coin change" print
{ { 5 10 } }
[ HS{ 1 5 10 25 100 } 15 find-fewest-coins ] unit-test

"change with Lilliputian Coins" print
{ { 4 4 15 } }
[ HS{ 1 4 15 20 50 } 23 find-fewest-coins ] unit-test

"change with Lower Elbonia Coins" print
{ { 21 21 21 } }
[ HS{ 1 5 10 21 25 } 63 find-fewest-coins ] unit-test

"large target values" print
{ { 2 2 5 20 20 50 100 100 100 100 100 100 100 100 100 } }
[ HS{ 1 2 5 10 20 50 100 } 999 find-fewest-coins ] unit-test

"possible change without unit coins available" print
{ { 2 2 2 5 10 } }
[ HS{ 2 5 10 20 50 } 21 find-fewest-coins ] unit-test

"another possible change without unit coins available" print
{ { 4 4 4 5 5 5 } }
[ HS{ 4 5 } 27 find-fewest-coins ] unit-test

"a greedy approach is not optimal" print
{ { 10 10 } }
[ HS{ 1 10 11 } 20 find-fewest-coins ] unit-test

"no coins make 0 change" print
{ { } }
[ HS{ 1 5 10 21 25 } 0 find-fewest-coins ] unit-test

"error testing for change smaller than the smallest of coins" print
[ HS{ 5 10 } 3 find-fewest-coins ] [ cannot-make-change? ] must-fail-with

"error if no combination can add up to target" print
[ HS{ 5 10 } 94 find-fewest-coins ] [ cannot-make-change? ] must-fail-with

"cannot find negative change values" print
[ HS{ 1 2 5 } -5 find-fewest-coins ] [ cannot-make-change? ] must-fail-with
