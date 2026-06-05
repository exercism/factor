USING: exercism-tools io kernel tools.test unicode wordy ;
IN: wordy.tests

"just a number" description
{ 5 } [ "What is 5?" answer ] unit-test

STOP-HERE

"just a zero" description
{ 0 } [ "What is 0?" answer ] unit-test

"just a negative number" description
{ -123 } [ "What is -123?" answer ] unit-test

"addition" description
{ 2 } [ "What is 1 plus 1?" answer ] unit-test

"addition with a left hand zero" description
{ 2 } [ "What is 0 plus 2?" answer ] unit-test

"addition with a right hand zero" description
{ 3 } [ "What is 3 plus 0?" answer ] unit-test

"more addition" description
{ 55 } [ "What is 53 plus 2?" answer ] unit-test

"addition with negative numbers" description
{ -11 } [ "What is -1 plus -10?" answer ] unit-test

"large addition" description
{ 45801 } [ "What is 123 plus 45678?" answer ] unit-test

"subtraction" description
{ 16 } [ "What is 4 minus -12?" answer ] unit-test

"multiplication" description
{ -75 } [ "What is -3 multiplied by 25?" answer ] unit-test

"division" description
{ -11 } [ "What is 33 divided by -3?" answer ] unit-test

"multiple additions" description
{ 3 } [ "What is 1 plus 1 plus 1?" answer ] unit-test

"addition and subtraction" description
{ 8 } [ "What is 1 plus 5 minus -2?" answer ] unit-test

"multiple subtraction" description
{ 3 } [ "What is 20 minus 4 minus 13?" answer ] unit-test

"subtraction then addition" description
{ 14 } [ "What is 17 minus 6 plus 3?" answer ] unit-test

"multiple multiplication" description
{ -12 } [ "What is 2 multiplied by -2 multiplied by 3?" answer ] unit-test

"addition and multiplication" description
{ -8 } [ "What is -3 plus 7 multiplied by -2?" answer ] unit-test

"multiple division" description
{ 2 } [ "What is -12 divided by 2 divided by -3?" answer ] unit-test

"unknown operation" description
[ "What is 52 cubed?" answer ] [ invalid-question? ] must-fail-with

"Non math question" description
[ "Who is the President of the United States?" answer ] [ invalid-question? ] must-fail-with

"reject problem missing an operand" description
[ "What is 1 plus?" answer ] [ invalid-question? ] must-fail-with

"reject problem with no operands or operators" description
[ "What is?" answer ] [ invalid-question? ] must-fail-with

"reject two operations in a row" description
[ "What is 1 plus plus 2?" answer ] [ invalid-question? ] must-fail-with

"reject two numbers in a row" description
[ "What is 1 plus 2 1?" answer ] [ invalid-question? ] must-fail-with

"reject postfix notation" description
[ "What is 1 2 plus?" answer ] [ invalid-question? ] must-fail-with

"reject prefix notation" description
[ "What is plus 1 2?" answer ] [ invalid-question? ] must-fail-with
