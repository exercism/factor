USING: exercism-tools io kernel killer-sudoku-helper tools.test unicode ;
IN: killer-sudoku-helper.tests

"1" description
{ { { 1 } } } [ 1 1 {  } combinations ] unit-test

STOP-HERE

"2" description
{ { { 2 } } } [ 2 1 {  } combinations ] unit-test

"3" description
{ { { 3 } } } [ 3 1 {  } combinations ] unit-test

"4" description
{ { { 4 } } } [ 4 1 {  } combinations ] unit-test

"5" description
{ { { 5 } } } [ 5 1 {  } combinations ] unit-test

"6" description
{ { { 6 } } } [ 6 1 {  } combinations ] unit-test

"7" description
{ { { 7 } } } [ 7 1 {  } combinations ] unit-test

"8" description
{ { { 8 } } } [ 8 1 {  } combinations ] unit-test

"9" description
{ { { 9 } } } [ 9 1 {  } combinations ] unit-test

"Cage with sum 45 contains all digits 1:9" description
{ { { 1 2 3 4 5 6 7 8 9 } } } [ 45 9 {  } combinations ] unit-test

"Cage with only 1 possible combination" description
{ { { 1 2 4 } } } [ 7 3 {  } combinations ] unit-test

"Cage with several combinations" description
{ { { 1 9 } { 2 8 } { 3 7 } { 4 6 } } } [ 10 2 {  } combinations ] unit-test

"Cage with several combinations that is restricted" description
{ { { 2 8 } { 3 7 } } } [ 10 2 { 1 4 } combinations ] unit-test
