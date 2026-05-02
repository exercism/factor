USING: exercism-tools io kernel math rational-numbers tools.test unicode ;
IN: rational-numbers.tests

"Rational Numbers:" print

"Add two positive rational numbers" print
{ { 7 6 } }
[ { 1 2 } >rat { 2 3 } >rat r+ rat>pair ]
unit-test

STOP-HERE

"Add a positive rational number and a negative rational number" print
{ { -1 6 } }
[ { 1 2 } >rat { -2 3 } >rat r+ rat>pair ]
unit-test

"Add two negative rational numbers" print
{ { -7 6 } }
[ { -1 2 } >rat { -2 3 } >rat r+ rat>pair ]
unit-test

"Add a rational number to its additive inverse" print
{ { 0 1 } }
[ { 1 2 } >rat { -1 2 } >rat r+ rat>pair ]
unit-test

"Subtract two positive rational numbers" print
{ { -1 6 } }
[ { 1 2 } >rat { 2 3 } >rat r- rat>pair ]
unit-test

"Subtract a positive rational number and a negative rational number" print
{ { 7 6 } }
[ { 1 2 } >rat { -2 3 } >rat r- rat>pair ]
unit-test

"Subtract two negative rational numbers" print
{ { 1 6 } }
[ { -1 2 } >rat { -2 3 } >rat r- rat>pair ]
unit-test

"Subtract a rational number from itself" print
{ { 0 1 } }
[ { 1 2 } >rat { 1 2 } >rat r- rat>pair ]
unit-test

"Multiply two positive rational numbers" print
{ { 1 3 } }
[ { 1 2 } >rat { 2 3 } >rat r* rat>pair ]
unit-test

"Multiply a negative rational number by a positive rational number" print
{ { -1 3 } }
[ { -1 2 } >rat { 2 3 } >rat r* rat>pair ]
unit-test

"Multiply two negative rational numbers" print
{ { 1 3 } }
[ { -1 2 } >rat { -2 3 } >rat r* rat>pair ]
unit-test

"Multiply a rational number by its reciprocal" print
{ { 1 1 } }
[ { 1 2 } >rat { 2 1 } >rat r* rat>pair ]
unit-test

"Multiply a rational number by 1" print
{ { 1 2 } }
[ { 1 2 } >rat { 1 1 } >rat r* rat>pair ]
unit-test

"Multiply a rational number by 0" print
{ { 0 1 } }
[ { 1 2 } >rat { 0 1 } >rat r* rat>pair ]
unit-test

"Divide two positive rational numbers" print
{ { 3 4 } }
[ { 1 2 } >rat { 2 3 } >rat r/ rat>pair ]
unit-test

"Divide a positive rational number by a negative rational number" print
{ { -3 4 } }
[ { 1 2 } >rat { -2 3 } >rat r/ rat>pair ]
unit-test

"Divide two negative rational numbers" print
{ { 3 4 } }
[ { -1 2 } >rat { -2 3 } >rat r/ rat>pair ]
unit-test

"Divide a rational number by 1" print
{ { 1 2 } }
[ { 1 2 } >rat { 1 1 } >rat r/ rat>pair ]
unit-test

"Absolute value of a positive rational number" print
{ { 1 2 } }
[ { 1 2 } >rat r-abs rat>pair ]
unit-test

"Absolute value of a positive rational number with negative numerator and denominator" print
{ { 1 2 } }
[ { -1 -2 } >rat r-abs rat>pair ]
unit-test

"Absolute value of a negative rational number" print
{ { 1 2 } }
[ { -1 2 } >rat r-abs rat>pair ]
unit-test

"Absolute value of a negative rational number with negative denominator" print
{ { 1 2 } }
[ { 1 -2 } >rat r-abs rat>pair ]
unit-test

"Absolute value of zero" print
{ { 0 1 } }
[ { 0 1 } >rat r-abs rat>pair ]
unit-test

"Absolute value of a rational number is reduced to lowest terms" print
{ { 1 2 } }
[ { 2 4 } >rat r-abs rat>pair ]
unit-test

"Raise a positive rational number to a positive integer power" print
{ { 1 8 } }
[ { 1 2 } >rat 3 r^ rat>pair ]
unit-test

"Raise a negative rational number to a positive integer power" print
{ { -1 8 } }
[ { -1 2 } >rat 3 r^ rat>pair ]
unit-test

"Raise a positive rational number to a negative integer power" print
{ { 25 9 } }
[ { 3 5 } >rat -2 r^ rat>pair ]
unit-test

"Raise a negative rational number to an even negative integer power" print
{ { 25 9 } }
[ { -3 5 } >rat -2 r^ rat>pair ]
unit-test

"Raise a negative rational number to an odd negative integer power" print
{ { -125 27 } }
[ { -3 5 } >rat -3 r^ rat>pair ]
unit-test

"Raise zero to an integer power" print
{ { 0 1 } }
[ { 0 1 } >rat 5 r^ rat>pair ]
unit-test

"Raise one to an integer power" print
{ { 1 1 } }
[ { 1 1 } >rat 4 r^ rat>pair ]
unit-test

"Raise a positive rational number to the power of zero" print
{ { 1 1 } }
[ { 1 2 } >rat 0 r^ rat>pair ]
unit-test

"Raise a negative rational number to the power of zero" print
{ { 1 1 } }
[ { -1 2 } >rat 0 r^ rat>pair ]
unit-test

"Raise a real number to a positive rational number" print
{ t }
[ 8 { 4 3 } >rat real^r 16.0 - abs 1e-9 < ]
unit-test

"Raise a real number to a negative rational number" print
{ t }
[ 9 { -1 2 } >rat real^r 0.3333333333333333 - abs 1e-9 < ]
unit-test

"Raise a real number to a zero rational number" print
{ t }
[ 2 { 0 1 } >rat real^r 1.0 - abs 1e-9 < ]
unit-test

"Reduce a positive rational number to lowest terms" print
{ { 1 2 } }
[ { 2 4 } >rat rat>pair ]
unit-test

"Reduce places the minus sign on the numerator" print
{ { -3 4 } }
[ { 3 -4 } >rat rat>pair ]
unit-test

"Reduce a negative rational number to lowest terms" print
{ { -2 3 } }
[ { -4 6 } >rat rat>pair ]
unit-test

"Reduce a rational number with a negative denominator to lowest terms" print
{ { -1 3 } }
[ { 3 -9 } >rat rat>pair ]
unit-test

"Reduce zero to lowest terms" print
{ { 0 1 } }
[ { 0 6 } >rat rat>pair ]
unit-test

"Reduce an integer to lowest terms" print
{ { -2 1 } }
[ { -14 7 } >rat rat>pair ]
unit-test

"Reduce one to lowest terms" print
{ { 1 1 } }
[ { 13 13 } >rat rat>pair ]
unit-test
