USING: binary-search exercism-tools io kernel tools.test unicode ;
IN: binary-search.tests

"finds a value in an array with one element" description
{ 0 }
[ { 6 } 6 find ] unit-test

STOP-HERE

"finds a value in the middle of an array" description
{ 3 }
[ { 1 3 4 6 8 9 11 } 6 find ] unit-test

"finds a value at the beginning of an array" description
{ 0 }
[ { 1 3 4 6 8 9 11 } 1 find ] unit-test

"finds a value at the end of an array" description
{ 6 }
[ { 1 3 4 6 8 9 11 } 11 find ] unit-test

"finds a value in an array of odd length" description
{ 9 }
[ { 1 3 5 8 13 21 34 55 89 144 233 377 634 } 144 find ] unit-test

"finds a value in an array of even length" description
{ 5 }
[ { 1 3 5 8 13 21 34 55 89 144 233 377 } 21 find ] unit-test

"identifies that a value is not included in the array" description
[ { 1 3 4 6 8 9 11 } 7 find ] [ value-not-in-array? ] must-fail-with

"a value smaller than the array's smallest value is not found" description
[ { 1 3 4 6 8 9 11 } 0 find ] [ value-not-in-array? ] must-fail-with

"a value larger than the array's largest value is not found" description
[ { 1 3 4 6 8 9 11 } 13 find ] [ value-not-in-array? ] must-fail-with

"nothing is found in an empty array" description
[ {  } 1 find ] [ value-not-in-array? ] must-fail-with

"nothing is found when the left and right bounds cross" description
[ { 1 2 } 0 find ] [ value-not-in-array? ] must-fail-with
