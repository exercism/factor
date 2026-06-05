USING: exercism-tools io kernel matrix tools.test unicode ;
IN: matrix.tests

"extract row from one number matrix" description
{ { 1 } } [ "1" <matrix> 1 nth-row ] unit-test

STOP-HERE

"can extract row" description
{ { 3 4 } } [ "1 2\n3 4" <matrix> 2 nth-row ] unit-test

"extract row where numbers have different widths" description
{ { 10 20 } } [ "1 2\n10 20" <matrix> 2 nth-row ] unit-test

"can extract row from non-square matrix with no corresponding column" description
{ { 8 7 6 } } [ "1 2 3\n4 5 6\n7 8 9\n8 7 6" <matrix> 4 nth-row ] unit-test

"extract column from one number matrix" description
{ { 1 } } [ "1" <matrix> 1 nth-column ] unit-test

"can extract column" description
{ { 3 6 9 } } [ "1 2 3\n4 5 6\n7 8 9" <matrix> 3 nth-column ] unit-test

"can extract column from non-square matrix with no corresponding row" description
{ { 4 8 6 } } [ "1 2 3 4\n5 6 7 8\n9 8 7 6" <matrix> 4 nth-column ] unit-test

"extract column where numbers have different widths" description
{ { 1903 3 4 } } [ "89 1903 3\n18 3 1\n9 4 800" <matrix> 2 nth-column ] unit-test
