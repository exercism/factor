USING: armstrong io kernel math sequences tools.test unicode ;
IN: armstrong.tests

"Armstrong numbers" print

"Zero is an Armstrong number" print
{ t } [ 0 armstrong? ] unit-test

"Single digit numbers are Armstrong numbers" print
{ t } [ 5 armstrong? ] unit-test

"There are no 2 digit Armstrong numbers" print
{ f } [ 10 armstrong? ] unit-test

"Three digit number that is an Armstrong number" print
{ t } [ 153 armstrong? ] unit-test

"Three digit number that is not an Armstrong number" print
{ f } [ 100 armstrong? ] unit-test

"Four digit number that is an Armstrong number" print
{ t } [ 9474 armstrong? ] unit-test

"Four digit number that is not an Armstrong number" print
{ f } [ 9475 armstrong? ] unit-test

"Seven digit number that is an Armstrong number" print
{ t } [ 9926315 armstrong? ] unit-test

"Seven digit number that is not an Armstrong number" print
{ f } [ 9926314 armstrong? ] unit-test

