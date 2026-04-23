USING: difference-of-squares io kernel lexer tools.test unicode ;
IN: difference-of-squares.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Difference Of Squares:" print

"square of sum 1" print
{ 1 } [ 1 square-of-sum ] unit-test

STOP-HERE

"square of sum 5" print
{ 225 } [ 5 square-of-sum ] unit-test

"square of sum 100" print
{ 25502500 } [ 100 square-of-sum ] unit-test

"sum of squares 1" print
{ 1 } [ 1 sum-of-squares ] unit-test

"sum of squares 5" print
{ 55 } [ 5 sum-of-squares ] unit-test

"sum of squares 100" print
{ 338350 } [ 100 sum-of-squares ] unit-test

"difference of squares 1" print
{ 0 } [ 1 difference-of-squares ] unit-test

"difference of squares 5" print
{ 170 } [ 5 difference-of-squares ] unit-test

"difference of squares 100" print
{ 25164150 } [ 100 difference-of-squares ] unit-test

"square of sum 90000" print
{ 16402864502025000000 } [ 90000 square-of-sum ] unit-test

"sum of squares 90000" print
{ 243004050015000 } [ 90000 sum-of-squares ] unit-test

"difference of squares 90000" print
{ 16402621497974985000 } [ 90000 difference-of-squares ] unit-test
