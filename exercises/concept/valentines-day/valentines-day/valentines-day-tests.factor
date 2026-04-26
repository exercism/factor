USING: tools.test valentines-day ;
IN: valentines-day.tests

! TASK: 1 rate-restaurant
{ yes } [ korean rate-restaurant ] unit-test
{ maybe } [ turkish rate-restaurant ] unit-test

! TASK: 2 rate-movie
{ yes } [ romance rate-movie ] unit-test
{ no } [ horror rate-movie ] unit-test
{ no } [ crime rate-movie ] unit-test
{ no } [ thriller rate-movie ] unit-test

! TASK: 3 rate-walk
{ yes } [ 12 rate-walk ] unit-test
{ yes } [ 100 rate-walk ] unit-test
{ maybe } [ 8 rate-walk ] unit-test
{ maybe } [ 7 rate-walk ] unit-test
{ no } [ 6 rate-walk ] unit-test
{ no } [ 3 rate-walk ] unit-test
{ no } [ 0 rate-walk ] unit-test

! TASK: 4 rate-activity
{ no } [ { board-game f } rate-activity ] unit-test
{ no } [ { chill f } rate-activity ] unit-test
{ yes } [ { movie romance } rate-activity ] unit-test
{ no } [ { movie horror } rate-activity ] unit-test
{ yes } [ { restaurant korean } rate-activity ] unit-test
{ maybe } [ { restaurant turkish } rate-activity ] unit-test
{ yes } [ { walk 12 } rate-activity ] unit-test
{ maybe } [ { walk 8 } rate-activity ] unit-test
{ no } [ { walk 3 } rate-activity ] unit-test

! TASK: 5 approval-counts
{ { 0 0 0 } } [ { } approval-counts ] unit-test
{ { 1 0 0 } } [ { { restaurant korean } } approval-counts ] unit-test
{ { 0 1 0 } } [ { { restaurant turkish } } approval-counts ] unit-test
{ { 0 0 2 } } [ { { board-game f } { movie horror } } approval-counts ] unit-test
{ { 2 1 1 } } [
    { { restaurant korean } { restaurant turkish } { walk 3 } { movie romance } }
    approval-counts
] unit-test
