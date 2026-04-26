USING: io kernel knapsack lexer tools.test unicode ;
IN: knapsack.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Knapsack:" print

"no items" print
{ 0 }
[ 100 {  } maximum-value ] unit-test

STOP-HERE

"one item, too heavy" print
{ 0 }
[ 10 { T{ item { weight 100 } { value 1 } } } maximum-value ] unit-test

"five items (cannot be greedy by weight)" print
{ 21 }
[ 10 { T{ item { weight 2 } { value 5 } } T{ item { weight 2 } { value 5 } } T{ item { weight 2 } { value 5 } } T{ item { weight 2 } { value 5 } } T{ item { weight 10 } { value 21 } } } maximum-value ] unit-test

"five items (cannot be greedy by value)" print
{ 80 }
[ 10 { T{ item { weight 2 } { value 20 } } T{ item { weight 2 } { value 20 } } T{ item { weight 2 } { value 20 } } T{ item { weight 2 } { value 20 } } T{ item { weight 10 } { value 50 } } } maximum-value ] unit-test

"example knapsack" print
{ 90 }
[ 10 { T{ item { weight 5 } { value 10 } } T{ item { weight 4 } { value 40 } } T{ item { weight 6 } { value 30 } } T{ item { weight 4 } { value 50 } } } maximum-value ] unit-test

"8 items" print
{ 900 }
[ 104 { T{ item { weight 25 } { value 350 } } T{ item { weight 35 } { value 400 } } T{ item { weight 45 } { value 450 } } T{ item { weight 5 } { value 20 } } T{ item { weight 25 } { value 70 } } T{ item { weight 3 } { value 8 } } T{ item { weight 2 } { value 5 } } T{ item { weight 2 } { value 5 } } } maximum-value ] unit-test

"15 items" print
{ 1458 }
[ 750 { T{ item { weight 70 } { value 135 } } T{ item { weight 73 } { value 139 } } T{ item { weight 77 } { value 149 } } T{ item { weight 80 } { value 150 } } T{ item { weight 82 } { value 156 } } T{ item { weight 87 } { value 163 } } T{ item { weight 90 } { value 173 } } T{ item { weight 94 } { value 184 } } T{ item { weight 98 } { value 192 } } T{ item { weight 106 } { value 201 } } T{ item { weight 110 } { value 210 } } T{ item { weight 113 } { value 214 } } T{ item { weight 115 } { value 221 } } T{ item { weight 118 } { value 229 } } T{ item { weight 120 } { value 240 } } } maximum-value ] unit-test
