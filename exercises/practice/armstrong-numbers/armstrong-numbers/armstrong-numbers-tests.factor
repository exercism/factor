USING: armstrong-numbers exercism-tools io kernel tools.test unicode ;
IN: armstrong-numbers.tests

"Zero is an Armstrong number" description
{ t } [ 0 armstrong? ] unit-test

STOP-HERE

"Single-digit numbers are Armstrong numbers" description
{ t } [ 5 armstrong? ] unit-test

"There are no two-digit Armstrong numbers" description
{ f } [ 10 armstrong? ] unit-test

"Three-digit number that is an Armstrong number" description
{ t } [ 153 armstrong? ] unit-test

"Three-digit number that is not an Armstrong number" description
{ f } [ 100 armstrong? ] unit-test

"Four-digit number that is an Armstrong number" description
{ t } [ 9474 armstrong? ] unit-test

"Four-digit number that is not an Armstrong number" description
{ f } [ 9475 armstrong? ] unit-test

"Seven-digit number that is an Armstrong number" description
{ t } [ 9926315 armstrong? ] unit-test

"Seven-digit number that is not an Armstrong number" description
{ f } [ 9926314 armstrong? ] unit-test
