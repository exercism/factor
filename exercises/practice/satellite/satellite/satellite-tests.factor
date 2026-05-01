USING: exercism-tools io kernel satellite tools.test unicode ;
IN: satellite.tests

"Satellite:" print

"Empty tree" print
{ f }
[ {  } {  } tree-from-traversals ] unit-test

STOP-HERE

"Tree with one item" print
{ T{ tree { value "a" } { left f } { right f } } }
[ { "a" } { "a" } tree-from-traversals ] unit-test

"Tree with many items" print
{ T{ tree { value "a" } { left T{ tree { value "i" } { left f } { right f } } } { right T{ tree { value "x" } { left T{ tree { value "f" } { left f } { right f } } } { right T{ tree { value "r" } { left f } { right f } } } } } } }
[ { "a" "i" "x" "f" "r" } { "i" "a" "f" "x" "r" } tree-from-traversals ] unit-test

"Reject traversals of different length" print
[ { "a" "b" } { "b" "a" "r" } tree-from-traversals ] [ invalid-traversals? ] must-fail-with

"Reject inconsistent traversals of same length" print
[ { "x" "y" "z" } { "a" "b" "c" } tree-from-traversals ] [ invalid-traversals? ] must-fail-with

"Reject traversals with repeated items" print
[ { "a" "b" "a" } { "b" "a" "a" } tree-from-traversals ] [ invalid-traversals? ] must-fail-with

"A degenerate binary tree" print
{ T{ tree { value "a" } { left T{ tree { value "b" } { left T{ tree { value "c" } { left T{ tree { value "d" } { left f } { right f } } } { right f } } } { right f } } } { right f } } }
[ { "a" "b" "c" "d" } { "d" "c" "b" "a" } tree-from-traversals ] unit-test

"Another degenerate binary tree" print
{ T{ tree { value "a" } { left f } { right T{ tree { value "b" } { left f } { right T{ tree { value "c" } { left f } { right T{ tree { value "d" } { left f } { right f } } } } } } } } }
[ { "a" "b" "c" "d" } { "a" "b" "c" "d" } tree-from-traversals ] unit-test

"Tree with many more items" print
{ T{ tree { value "a" } { left T{ tree { value "b" } { left T{ tree { value "d" } { left T{ tree { value "g" } { left f } { right f } } } { right T{ tree { value "h" } { left f } { right f } } } } } { right f } } } { right T{ tree { value "c" } { left T{ tree { value "e" } { left f } { right f } } } { right T{ tree { value "f" } { left T{ tree { value "i" } { left f } { right f } } } { right f } } } } } } }
[ { "a" "b" "d" "g" "h" "c" "e" "f" "i" } { "g" "d" "h" "b" "a" "e" "c" "i" "f" } tree-from-traversals ] unit-test
