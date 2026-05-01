USING: exercism-tools rpn-calculator tools.test ;
IN: rpn-calculator.tests

TASK: 1 add-op
{ { 7 } } [ { 3 4 } add-op ] unit-test
{ { 1 2 7 } } [ { 1 2 3 4 } add-op ] unit-test
{ { 0 } } [ { -3 3 } add-op ] unit-test

TASK: 2 multiply-op
{ { 12 } } [ { 3 4 } multiply-op ] unit-test
{ { 1 2 12 } } [ { 1 2 3 4 } multiply-op ] unit-test
{ { 0 } } [ { 10 0 } multiply-op ] unit-test

TASK: 3 apply-op
{ { 7 } } [ { 3 4 } [ add-op ] apply-op ] unit-test
{ { 12 } } [ { 3 4 } [ multiply-op ] apply-op ] unit-test

TASK: 4 evaluate
{ { 27 } } [ { 3 4 5 } { [ add-op ] [ multiply-op ] } evaluate ] unit-test
{ { 3 4 } } [ { 3 4 } { } evaluate ] unit-test
{ { 15 } } [
    { 1 2 3 4 } { [ add-op ] [ multiply-op ] [ add-op ] } evaluate
] unit-test

TASK: 5 evaluate-named
{ { 3 4 } } [
    { 3 4 } H{ { "+" [ add-op ] } { "*" [ multiply-op ] } } { }
    evaluate-named
] unit-test

{ { 27 } } [
    { 3 4 5 } H{ { "+" [ add-op ] } { "*" [ multiply-op ] } } { "+" "*" }
    evaluate-named
] unit-test

{ { 15 } } [
    { 1 2 3 4 }
    H{ { "+" [ add-op ] } { "*" [ multiply-op ] } }
    { "+" "*" "+" } evaluate-named
] unit-test

TASK: 6 divide-op
{ { 3 } } [ { 12 4 } divide-op ] unit-test
{ { 1 5 3 } } [ { 1 5 6 2 } divide-op ] unit-test
{ { 1 1 } } [ { 1 6 6 } divide-op ] unit-test
[ { 5 0 } divide-op ] [ zero-divisor-error? ] must-fail-with
[ { 1 2 3 0 } divide-op ] [ zero-divisor-error? ] must-fail-with
