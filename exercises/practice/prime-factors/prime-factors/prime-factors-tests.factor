USING: exercism-tools io kernel prime-factors tools.test unicode ;
IN: prime-factors.tests

"Prime Factors:" print

"no factors" print
{ {  } } [ 1 factors ] unit-test

STOP-HERE

"prime number" print
{ { 2 } } [ 2 factors ] unit-test

"another prime number" print
{ { 3 } } [ 3 factors ] unit-test

"square of a prime" print
{ { 3 3 } } [ 9 factors ] unit-test

"product of first prime" print
{ { 2 2 } } [ 4 factors ] unit-test

"cube of a prime" print
{ { 2 2 2 } } [ 8 factors ] unit-test

"product of second prime" print
{ { 3 3 3 } } [ 27 factors ] unit-test

"product of third prime" print
{ { 5 5 5 5 } } [ 625 factors ] unit-test

"product of first and second prime" print
{ { 2 3 } } [ 6 factors ] unit-test

"product of primes and non-primes" print
{ { 2 2 3 } } [ 12 factors ] unit-test

"product of primes" print
{ { 5 17 23 461 } } [ 901255 factors ] unit-test

"factors include a large prime" print
{ { 11 9539 894119 } } [ 93819012551 factors ] unit-test
