USING: exercism-tools forth forth.builtins io kernel tools.test unicode ;
IN: forth.tests

"Forth:" print

"numbers just get pushed onto the stack" print
{ { 1 2 3 4 5 } }
[ { "1 2 3 4 5" } evaluate ]
unit-test

STOP-HERE

"pushes negative numbers onto the stack" print
{ { -1 -2 -3 -4 -5 } }
[ { "-1 -2 -3 -4 -5" } evaluate ]
unit-test

"can add two numbers" print
{ { 3 } }
[ { "1 2 +" } evaluate ]
unit-test

"errors if there is nothing on the stack" print
[ { "+" } evaluate ] [ empty-stack? ] must-fail-with

"errors if there is only one value on the stack" print
[ { "1 +" } evaluate ] [ only-one-value-on-the-stack? ] must-fail-with

"more than two values on the stack" print
{ { 1 5 } }
[ { "1 2 3 +" } evaluate ]
unit-test

"can subtract two numbers" print
{ { -1 } }
[ { "3 4 -" } evaluate ]
unit-test

"errors if there is nothing on the stack" print
[ { "-" } evaluate ] [ empty-stack? ] must-fail-with

"errors if there is only one value on the stack" print
[ { "1 -" } evaluate ] [ only-one-value-on-the-stack? ] must-fail-with

"more than two values on the stack" print
{ { 1 9 } }
[ { "1 12 3 -" } evaluate ]
unit-test

"can multiply two numbers" print
{ { 8 } }
[ { "2 4 *" } evaluate ]
unit-test

"errors if there is nothing on the stack" print
[ { "*" } evaluate ] [ empty-stack? ] must-fail-with

"errors if there is only one value on the stack" print
[ { "1 *" } evaluate ] [ only-one-value-on-the-stack? ] must-fail-with

"more than two values on the stack" print
{ { 1 6 } }
[ { "1 2 3 *" } evaluate ]
unit-test

"can divide two numbers" print
{ { 4 } }
[ { "12 3 /" } evaluate ]
unit-test

"performs integer division" print
{ { 2 } }
[ { "8 3 /" } evaluate ]
unit-test

"errors if dividing by zero" print
[ { "4 0 /" } evaluate ] [ divide-by-zero? ] must-fail-with

"errors if there is nothing on the stack" print
[ { "/" } evaluate ] [ empty-stack? ] must-fail-with

"errors if there is only one value on the stack" print
[ { "1 /" } evaluate ] [ only-one-value-on-the-stack? ] must-fail-with

"more than two values on the stack" print
{ { 1 4 } }
[ { "1 12 3 /" } evaluate ]
unit-test

"addition and subtraction" print
{ { -1 } }
[ { "1 2 + 4 -" } evaluate ]
unit-test

"multiplication and division" print
{ { 2 } }
[ { "2 4 * 3 /" } evaluate ]
unit-test

"multiplication and addition" print
{ { 13 } }
[ { "1 3 4 * +" } evaluate ]
unit-test

"addition and multiplication" print
{ { 7 } }
[ { "1 3 4 + *" } evaluate ]
unit-test

"copies a value on the stack" print
{ { 1 1 } }
[ { "1 dup" } evaluate ]
unit-test

"copies the top value on the stack" print
{ { 1 2 2 } }
[ { "1 2 dup" } evaluate ]
unit-test

"errors if there is nothing on the stack" print
[ { "dup" } evaluate ] [ empty-stack? ] must-fail-with

"removes the top value on the stack if it is the only one" print
{ {  } }
[ { "1 drop" } evaluate ]
unit-test

"removes the top value on the stack if it is not the only one" print
{ { 1 } }
[ { "1 2 drop" } evaluate ]
unit-test

"errors if there is nothing on the stack" print
[ { "drop" } evaluate ] [ empty-stack? ] must-fail-with

"swaps the top two values on the stack if they are the only ones" print
{ { 2 1 } }
[ { "1 2 swap" } evaluate ]
unit-test

"swaps the top two values on the stack if they are not the only ones" print
{ { 1 3 2 } }
[ { "1 2 3 swap" } evaluate ]
unit-test

"errors if there is nothing on the stack" print
[ { "swap" } evaluate ] [ empty-stack? ] must-fail-with

"errors if there is only one value on the stack" print
[ { "1 swap" } evaluate ] [ only-one-value-on-the-stack? ] must-fail-with

"copies the second element if there are only two" print
{ { 1 2 1 } }
[ { "1 2 over" } evaluate ]
unit-test

"copies the second element if there are more than two" print
{ { 1 2 3 2 } }
[ { "1 2 3 over" } evaluate ]
unit-test

"errors if there is nothing on the stack" print
[ { "over" } evaluate ] [ empty-stack? ] must-fail-with

"errors if there is only one value on the stack" print
[ { "1 over" } evaluate ] [ only-one-value-on-the-stack? ] must-fail-with

"can consist of built-in words" print
{ { 1 1 1 } }
[ { ": dup-twice dup dup ;" "1 dup-twice" } evaluate ]
unit-test

"execute in the right order" print
{ { 1 2 3 } }
[ { ": countup 1 2 3 ;" "countup" } evaluate ]
unit-test

"can override other user-defined words" print
{ { 1 1 1 } }
[ { ": foo dup ;" ": foo dup dup ;" "1 foo" } evaluate ]
unit-test

"can override built-in words" print
{ { 1 1 } }
[ { ": swap dup ;" "1 swap" } evaluate ]
unit-test

"can override built-in operators" print
{ { 12 } }
[ { ": + * ;" "3 4 +" } evaluate ]
unit-test

"can use different words with the same name" print
{ { 5 6 } }
[ { ": foo 5 ;" ": bar foo ;" ": foo 6 ;" "bar foo" } evaluate ]
unit-test

"can define word that uses word with the same name" print
{ { 11 } }
[ { ": foo 10 ;" ": foo foo 1 + ;" "foo" } evaluate ]
unit-test

"cannot redefine non-negative numbers" print
[ { ": 1 2 ;" } evaluate ] [ illegal-operation? ] must-fail-with

"cannot redefine negative numbers" print
[ { ": -1 2 ;" } evaluate ] [ illegal-operation? ] must-fail-with

"errors if executing a non-existent word" print
[ { "foo" } evaluate ] [ undefined-operation? ] must-fail-with

"only defines locally" print
{ { 0 } { 2 } }
[ { ": + - ;" "1 1 +" } evaluate { "1 1 +" } evaluate ]
unit-test

"DUP is case-insensitive" print
{ { 1 1 1 1 } }
[ { "1 DUP Dup dup" } evaluate ]
unit-test

"DROP is case-insensitive" print
{ { 1 } }
[ { "1 2 3 4 DROP Drop drop" } evaluate ]
unit-test

"SWAP is case-insensitive" print
{ { 2 3 4 1 } }
[ { "1 2 SWAP 3 Swap 4 swap" } evaluate ]
unit-test

"OVER is case-insensitive" print
{ { 1 2 1 2 1 } }
[ { "1 2 OVER Over over" } evaluate ]
unit-test

"user-defined words are case-insensitive" print
{ { 1 1 1 1 } }
[ { ": foo dup ;" "1 FOO Foo foo" } evaluate ]
unit-test

"definitions are case-insensitive" print
{ { 1 1 1 1 } }
[ { ": SWAP DUP Dup dup ;" "1 swap" } evaluate ]
unit-test
