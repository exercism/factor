USING: exercism-tools io kernel leap tools.test unicode ;
IN: leap.tests

"Leap:" print

"year not divisible by 4 in common year" print
{ f } [ 2015 leap-year? ] unit-test

STOP-HERE

"year divisible by 2, not divisible by 4 in common year" print
{ f } [ 1970 leap-year? ] unit-test

"year divisible by 4, not divisible by 100 in leap year" print
{ t } [ 1996 leap-year? ] unit-test

"year divisible by 4 and 5 is still a leap year" print
{ t } [ 1960 leap-year? ] unit-test

"year divisible by 100, not divisible by 400 in common year" print
{ f } [ 2100 leap-year? ] unit-test

"year divisible by 100 but not by 3 is still not a leap year" print
{ f } [ 1900 leap-year? ] unit-test

"year divisible by 400 is leap year" print
{ t } [ 2000 leap-year? ] unit-test

"year divisible by 400 but not by 125 is still a leap year" print
{ t } [ 2400 leap-year? ] unit-test

"year divisible by 200, not divisible by 400 in common year" print
{ f } [ 1800 leap-year? ] unit-test
