USING: exercism-tools io kernel prime-factors tools.test unicode ;
IN: prime-factors.tests

"no factors" description
{ {  } } [ 1 factors ] unit-test

STOP-HERE

"prime number" description
{ { 2 } } [ 2 factors ] unit-test

"another prime number" description
{ { 3 } } [ 3 factors ] unit-test

"square of a prime" description
{ { 3 3 } } [ 9 factors ] unit-test

"product of first prime" description
{ { 2 2 } } [ 4 factors ] unit-test

"cube of a prime" description
{ { 2 2 2 } } [ 8 factors ] unit-test

"product of second prime" description
{ { 3 3 3 } } [ 27 factors ] unit-test

"product of third prime" description
{ { 5 5 5 5 } } [ 625 factors ] unit-test

"product of first and second prime" description
{ { 2 3 } } [ 6 factors ] unit-test

"product of primes and non-primes" description
{ { 2 2 3 } } [ 12 factors ] unit-test

"product of primes" description
{ { 5 17 23 461 } } [ 901255 factors ] unit-test

"factors include a large prime" description
{ { 11 9539 894119 } } [ 93819012551 factors ] unit-test
