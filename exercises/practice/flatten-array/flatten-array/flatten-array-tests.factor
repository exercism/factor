USING: exercism-tools flatten-array io kernel tools.test unicode ;
IN: flatten-array.tests

"Flatten Array:" print

"empty" print
{ {  } }
[ {  } flatten ] unit-test

STOP-HERE

"no nesting" print
{ { 0 1 2 } }
[ { 0 1 2 } flatten ] unit-test

"flattens a nested array" print
{ {  } }
[ { { {  } } } flatten ] unit-test

"flattens array with just integers present" print
{ { 1 2 3 4 5 6 7 8 } }
[ { 1 { 2 3 4 5 6 7 } 8 } flatten ] unit-test

"5 level nesting" print
{ { 0 2 2 3 8 100 4 50 -2 } }
[ { 0 2 { { 2 3 } 8 100 4 { { { 50 } } } } -2 } flatten ] unit-test

"6 level nesting" print
{ { 1 2 3 4 5 6 7 8 } }
[ { 1 { 2 { { 3 } } { 4 { { 5 } } } 6 7 } 8 } flatten ] unit-test

"null values are omitted from the final result" print
{ { 1 2 } }
[ { 1 2 f } flatten ] unit-test

"consecutive null values at the front of the array are omitted from the final result" print
{ { 3 } }
[ { f f 3 } flatten ] unit-test

"consecutive null values in the middle of the array are omitted from the final result" print
{ { 1 4 } }
[ { 1 f f 4 } flatten ] unit-test

"6 level nested array with null values" print
{ { 0 2 2 3 8 100 -2 } }
[ { 0 2 { { 2 3 } 8 { { 100 } } f { { f } } } -2 } flatten ] unit-test

"all values in nested array are null" print
{ {  } }
[ { f { { { f } } } f f { { f f } f } f } flatten ] unit-test
