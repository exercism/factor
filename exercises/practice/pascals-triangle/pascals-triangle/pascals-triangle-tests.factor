USING: io kernel lexer pascals-triangle tools.test unicode ;
IN: pascals-triangle.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Pascals Triangle:" print

"zero rows" print
{ {  } }
[ 0 rows ] unit-test

STOP-HERE

"single row" print
{ { { 1 } } }
[ 1 rows ] unit-test

"two rows" print
{ { { 1 } { 1 1 } } }
[ 2 rows ] unit-test

"three rows" print
{ { { 1 } { 1 1 } { 1 2 1 } } }
[ 3 rows ] unit-test

"four rows" print
{ { { 1 } { 1 1 } { 1 2 1 } { 1 3 3 1 } } }
[ 4 rows ] unit-test

"five rows" print
{ { { 1 } { 1 1 } { 1 2 1 } { 1 3 3 1 } { 1 4 6 4 1 } } }
[ 5 rows ] unit-test

"six rows" print
{ { { 1 } { 1 1 } { 1 2 1 } { 1 3 3 1 } { 1 4 6 4 1 } { 1 5 10 10 5 1 } } }
[ 6 rows ] unit-test

"ten rows" print
{ { { 1 } { 1 1 } { 1 2 1 } { 1 3 3 1 } { 1 4 6 4 1 } { 1 5 10 10 5 1 } { 1 6 15 20 15 6 1 } { 1 7 21 35 35 21 7 1 } { 1 8 28 56 70 56 28 8 1 } { 1 9 36 84 126 126 84 36 9 1 } } }
[ 10 rows ] unit-test
