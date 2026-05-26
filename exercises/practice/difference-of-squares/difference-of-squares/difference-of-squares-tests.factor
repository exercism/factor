USING: difference-of-squares exercism-tools io kernel tools.test unicode ;
IN: difference-of-squares.tests

"square of sum 1" description
{ 1 } [ 1 square-of-sum ] unit-test

STOP-HERE

"square of sum 5" description
{ 225 } [ 5 square-of-sum ] unit-test

"square of sum 100" description
{ 25502500 } [ 100 square-of-sum ] unit-test

"sum of squares 1" description
{ 1 } [ 1 sum-of-squares ] unit-test

"sum of squares 5" description
{ 55 } [ 5 sum-of-squares ] unit-test

"sum of squares 100" description
{ 338350 } [ 100 sum-of-squares ] unit-test

"difference of squares 1" description
{ 0 } [ 1 difference-of-squares ] unit-test

"difference of squares 5" description
{ 170 } [ 5 difference-of-squares ] unit-test

"difference of squares 100" description
{ 25164150 } [ 100 difference-of-squares ] unit-test

"square of sum 90000" description
{ 16402864502025000000 } [ 90000 square-of-sum ] unit-test

"sum of squares 90000" description
{ 243004050015000 } [ 90000 sum-of-squares ] unit-test

"difference of squares 90000" description
{ 16402621497974985000 } [ 90000 difference-of-squares ] unit-test
