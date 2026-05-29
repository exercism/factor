USING: exercism-tools io kernel series tools.test unicode ;
IN: series.tests

"slices of one from one" description
{ { "1" } } [ "1" 1 slices ] unit-test

STOP-HERE

"slices of one from two" description
{ { "1" "2" } } [ "12" 1 slices ] unit-test

"slices of two" description
{ { "35" } } [ "35" 2 slices ] unit-test

"slices of two overlap" description
{ { "91" "14" "42" } } [ "9142" 2 slices ] unit-test

"slices can include duplicates" description
{ { "777" "777" "777" "777" } } [ "777777" 3 slices ] unit-test

"slices of a long series" description
{ { "91849" "18493" "84939" "49390" "93904" "39042" "90424" "04243" } } [ "918493904243" 5 slices ] unit-test

"slice length is too large" description
[ "12345" 6 slices ] [ "slice length cannot be greater than series length" = ] must-fail-with

"slice length is way too large" description
[ "12345" 42 slices ] [ "slice length cannot be greater than series length" = ] must-fail-with

"slice length cannot be zero" description
[ "12345" 0 slices ] [ "slice length cannot be zero" = ] must-fail-with

"slice length cannot be negative" description
[ "123" -1 slices ] [ "slice length cannot be negative" = ] must-fail-with

"empty series is invalid" description
[ "" 1 slices ] [ "series cannot be empty" = ] must-fail-with
