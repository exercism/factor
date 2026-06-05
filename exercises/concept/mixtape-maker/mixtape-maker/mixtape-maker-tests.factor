USING: exercism-tools mixtape-maker io kernel tools.test unicode ;
IN: mixtape-maker.tests

TASK: 1 count-combinations
{ 10 } [ 5 2 count-combinations ] unit-test

STOP-HERE

{ 20 } [ 6 3 count-combinations ] unit-test
{ 1 }  [ 5 5 count-combinations ] unit-test
{ 1 }  [ 4 0 count-combinations ] unit-test

TASK: 2 count-permutations
{ 20 }  [ 5 2 count-permutations ] unit-test
{ 120 } [ 6 3 count-permutations ] unit-test
{ 4 }   [ 4 1 count-permutations ] unit-test

TASK: 3 list-combinations
{ { { 1 2 } { 1 3 } { 2 3 } } } [ { 1 2 3 } 2 list-combinations ] unit-test
{ { { 1 2 3 } { 1 2 4 } { 1 3 4 } { 2 3 4 } } }
    [ { 1 2 3 4 } 3 list-combinations ] unit-test

TASK: 4 list-permutations
{ { { 1 2 } { 2 1 } } } [ { 1 2 } list-permutations ] unit-test
{ { { 1 2 3 } { 1 3 2 } { 2 1 3 } { 2 3 1 } { 3 1 2 } { 3 2 1 } } }
    [ { 1 2 3 } list-permutations ] unit-test

TASK: 5 combinations-summing-to
{ { { 1 4 } { 2 3 } } } [ { 1 2 3 4 } 2 5 combinations-summing-to ] unit-test
{ { { 1 5 } { 2 4 } } } [ { 1 2 3 4 5 } 2 6 combinations-summing-to ] unit-test
{ { } }                 [ { 1 2 3 } 2 99 combinations-summing-to ] unit-test
