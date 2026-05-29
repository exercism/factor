USING: calendar exercism-tools ferry-schedule kernel tools.test ;
IN: ferry-schedule.tests

TASK: 1 make-date
{ 2024 7 14 } [ 2024 7 14 make-date >date< ] unit-test

STOP-HERE

TASK: 2 weekday-name
{ "Sunday" } [ 2024 1 7 make-date weekday-name ] unit-test
{ "Monday" } [ 2024 1 8 make-date weekday-name ] unit-test
{ "Thursday" } [ 2024 2 29 make-date weekday-name ] unit-test

TASK: 3 leap?
{ t } [ 2024 leap? ] unit-test
{ f } [ 2023 leap? ] unit-test
! Century years are leap years only when divisible by 400.
{ f } [ 1900 leap? ] unit-test
{ t } [ 2000 leap? ] unit-test

TASK: 4 month-length
! February has 29 days in a leap year, 28 otherwise.
{ 29 } [ 2024 2 month-length ] unit-test
{ 28 } [ 2023 2 month-length ] unit-test
{ 31 } [ 2024 1 month-length ] unit-test
{ 30 } [ 2024 4 month-length ] unit-test

TASK: 5 add-days
{ t } [
    2024 1 31 make-date 1 add-days
    2024 2 1 make-date =
] unit-test

! Adding days rolls over into the next year.
{ t } [
    2023 12 31 make-date 1 add-days
    2024 1 1 make-date =
] unit-test

! February gains a 29th day in a leap year.
{ t } [
    2024 2 28 make-date 1 add-days
    2024 2 29 make-date =
] unit-test

{ t } [
    2024 3 1 make-date 10 add-days
    2024 3 11 make-date =
] unit-test
