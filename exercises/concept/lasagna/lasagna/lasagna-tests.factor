USING: lasagna tools.test ;
IN: lasagna.tests

! TASK: 1 expected bake time
{ 40 } [ expected-bake-time ] unit-test

! TASK: 2 preparation time
{ 2 } [ 1 preparation-time ] unit-test
{ 8 } [ 4 preparation-time ] unit-test

! TASK: 3 remaining time
{ 15 } [ 25 remaining-time ] unit-test

! TASK: 4 total working time
{ 32 } [ 1 30 total-working-time ] unit-test
{ 16 } [ 4 8 total-working-time ] unit-test
