USING: exercism-tools pursers-pantry tools.test ;
IN: pursers-pantry.tests

TASK: 1 create-inventory
{ H{ { "coal" 1 } { "wood" 2 } { "diamond" 3 } } } [
    { "coal" "wood" "wood" "diamond" "diamond" "diamond" } create-inventory
] unit-test

STOP-HERE

{ H{ } } [ { } create-inventory ] unit-test

TASK: 2 add-items
{ H{ { "coal" 2 } { "wood" 2 } { "iron" 1 } } } [
    H{ { "coal" 1 } } { "wood" "iron" "coal" "wood" } add-items
] unit-test

TASK: 3 decrement-items
{ H{ { "coal" 2 } { "diamond" 0 } { "iron" 3 } } } [
    H{ { "coal" 3 } { "diamond" 1 } { "iron" 5 } }
    { "diamond" "coal" "iron" "iron" } decrement-items
] unit-test

{ H{ { "coal" 0 } { "wood" 0 } { "diamond" 1 } } } [
    H{ { "coal" 2 } { "wood" 1 } { "diamond" 2 } }
    { "coal" "coal" "wood" "wood" "diamond" } decrement-items
] unit-test

{ H{ { "coal" 2 } } } [
    H{ { "coal" 2 } } { "gold" "silver" } decrement-items
] unit-test

TASK: 4 remove-item
{ H{ { "wood" 1 } { "diamond" 2 } } } [
    H{ { "coal" 2 } { "wood" 1 } { "diamond" 2 } } "coal" remove-item
] unit-test

{ H{ { "coal" 2 } { "wood" 1 } { "diamond" 2 } } } [
    H{ { "coal" 2 } { "wood" 1 } { "diamond" 2 } } "gold" remove-item
] unit-test

TASK: 5 list-inventory
{ { { "coal" 7 } { "diamond" 2 } { "iron" 7 } { "wood" 11 } } } [
    H{ { "coal" 7 } { "wood" 11 } { "diamond" 2 } { "iron" 7 } { "silver" 0 } }
    list-inventory
] unit-test

{ { } } [ H{ } list-inventory ] unit-test
