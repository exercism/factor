USING: exercism-tools lasagna-luminary tools.test ;
IN: lasagna-luminary.tests

TASK: 1 cooking-status
{ "Lasagna is done." } [ 0 cooking-status ] unit-test

STOP-HERE

{ "Not done, please wait." } [ 12 cooking-status ] unit-test
{ "You forgot to set the timer." } [ f cooking-status ] unit-test

TASK: 2 preparation-time
{ 18 } [
    { "sauce" "noodles" "sauce" "meat" "mozzarella" "noodles" } 3 preparation-time
] unit-test

{ 0 } [ { } 5 preparation-time ] unit-test

TASK: 3 quantities
{ 100 2/5 } [
    { "sauce" "noodles" "sauce" "meat" "mozzarella" "noodles" } quantities
] unit-test

{ 0 0 } [ { } quantities ] unit-test

TASK: 4 add-secret-ingredient
{ { "noodles" "meat" "sauce" "mozzarella" "kampot pepper" } } [
    { "noodles" "sauce" "mozzarella" "kampot pepper" }
    { "noodles" "meat" "sauce" "mozzarella" }
    add-secret-ingredient
] unit-test

TASK: 5 scale-recipe
{ H{ { "noodles" 400 } { "sauce" 1 } { "mozzarella" 2 } { "meat" 200 } } } [
    H{ { "noodles" 200 } { "sauce" 1/2 } { "mozzarella" 1 } { "meat" 100 } }
    4 scale-recipe
] unit-test

{ H{ { "noodles" 100 } } } [
    H{ { "noodles" 200 } } 1 scale-recipe
] unit-test
