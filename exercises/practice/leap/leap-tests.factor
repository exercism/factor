USING: io leap tools.test ;
IN: leap.tests

"Leap year:" print

"not very common" print
{ f } [ 2015 my-leap-year? ] unit-test

"introduced every 4 years to adjust about a day" print
{ t } [ 2016 my-leap-year? ] unit-test

"skipped every 100 years to remove an extra day" print
{ f } [ 1900 my-leap-year? ] unit-test

"reintroduced every 400 years to adjust yet another day" print
{ t } [ 2000 my-leap-year? ] unit-test



"Additional corner cases of leap years:" print

"not a leap year" print
{ f } [ 1978 my-leap-year? ] unit-test

"a common leap year" print
{ t } [ 1992 my-leap-year? ] unit-test

"is skipped every 100 years" print
{ f } [ 2100 my-leap-year? ] unit-test

"reintroduced every 400 years" print
{ f } [ 2100 my-leap-year? ] unit-test
