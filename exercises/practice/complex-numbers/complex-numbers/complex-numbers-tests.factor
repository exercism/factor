USING: accessors arrays complex-numbers exercism-tools io kernel math math.constants math.functions sequences tools.test unicode ;
IN: complex-numbers.tests

"Complex Numbers:" print

"Real part of a purely real number" print
{ 1 }
[ 1 0 <cmplx> real>> ]
unit-test

STOP-HERE

"Real part of a purely imaginary number" print
{ 0 }
[ 0 1 <cmplx> real>> ]
unit-test

"Real part of a number with real and imaginary part" print
{ 1 }
[ 1 2 <cmplx> real>> ]
unit-test

"Imaginary part of a purely real number" print
{ 0 }
[ 1 0 <cmplx> imaginary>> ]
unit-test

"Imaginary part of a purely imaginary number" print
{ 1 }
[ 0 1 <cmplx> imaginary>> ]
unit-test

"Imaginary part of a number with real and imaginary part" print
{ 2 }
[ 1 2 <cmplx> imaginary>> ]
unit-test

"Imaginary unit" print
{ t }
[ 0 1 <cmplx> 0 1 <cmplx> c* cmplx>pair
  -1 0 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Add purely real numbers" print
{ t }
[ 1 0 <cmplx> 2 0 <cmplx> c+ cmplx>pair
  3 0 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Add purely imaginary numbers" print
{ t }
[ 0 1 <cmplx> 0 2 <cmplx> c+ cmplx>pair
  0 3 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Add numbers with real and imaginary part" print
{ t }
[ 1 2 <cmplx> 3 4 <cmplx> c+ cmplx>pair
  4 6 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Subtract purely real numbers" print
{ t }
[ 1 0 <cmplx> 2 0 <cmplx> c- cmplx>pair
  -1 0 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Subtract purely imaginary numbers" print
{ t }
[ 0 1 <cmplx> 0 2 <cmplx> c- cmplx>pair
  0 -1 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Subtract numbers with real and imaginary part" print
{ t }
[ 1 2 <cmplx> 3 4 <cmplx> c- cmplx>pair
  -2 -2 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Multiply purely real numbers" print
{ t }
[ 1 0 <cmplx> 2 0 <cmplx> c* cmplx>pair
  2 0 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Multiply purely imaginary numbers" print
{ t }
[ 0 1 <cmplx> 0 2 <cmplx> c* cmplx>pair
  -2 0 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Multiply numbers with real and imaginary part" print
{ t }
[ 1 2 <cmplx> 3 4 <cmplx> c* cmplx>pair
  -5 10 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Divide purely real numbers" print
{ t }
[ 1 0 <cmplx> 2 0 <cmplx> c/ cmplx>pair
  0.5 0.0 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Divide purely imaginary numbers" print
{ t }
[ 0 1 <cmplx> 0 2 <cmplx> c/ cmplx>pair
  0.5 0.0 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Divide numbers with real and imaginary part" print
{ t }
[ 1 2 <cmplx> 3 4 <cmplx> c/ cmplx>pair
  0.44 0.08 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Absolute value of a positive purely real number" print
{ t }
[ 5 0 <cmplx> c-abs 5 - abs 1e-9 < ]
unit-test

"Absolute value of a negative purely real number" print
{ t }
[ -5 0 <cmplx> c-abs 5 - abs 1e-9 < ]
unit-test

"Absolute value of a purely imaginary number with positive imaginary part" print
{ t }
[ 0 5 <cmplx> c-abs 5 - abs 1e-9 < ]
unit-test

"Absolute value of a purely imaginary number with negative imaginary part" print
{ t }
[ 0 -5 <cmplx> c-abs 5 - abs 1e-9 < ]
unit-test

"Absolute value of a number with real and imaginary part" print
{ t }
[ 3 4 <cmplx> c-abs 5 - abs 1e-9 < ]
unit-test

"Conjugate a purely real number" print
{ t }
[ 5 0 <cmplx> c-conj cmplx>pair
  5 0 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Conjugate a purely imaginary number" print
{ t }
[ 0 5 <cmplx> c-conj cmplx>pair
  0 -5 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Conjugate a number with real and imaginary part" print
{ t }
[ 1 1 <cmplx> c-conj cmplx>pair
  1 -1 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Euler's identity/formula" print
{ t }
[ 0 pi <cmplx> c-exp cmplx>pair
  -1 0 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Exponential of 0" print
{ t }
[ 0 0 <cmplx> c-exp cmplx>pair
  1 0 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Exponential of a purely real number" print
{ t }
[ 1 0 <cmplx> c-exp cmplx>pair
  e 0 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Exponential of a number with real and imaginary part" print
{ t }
[ 2 log pi <cmplx> c-exp cmplx>pair
  -2 0 2array [ - abs 1e-9 < ] 2all? ]
unit-test

"Exponential resulting in a number with real and imaginary part" print
{ t }
[ 2 log 2 / pi 4 / <cmplx> c-exp cmplx>pair
  1 1 2array [ - abs 1e-9 < ] 2all? ]
unit-test
