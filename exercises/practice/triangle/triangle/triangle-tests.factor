USING: io kernel lexer tools.test triangle unicode ;
IN: triangle.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Triangle:" print

"all sides are equal" print
{ t } [ 2 2 2 <triangle> equilateral? ] unit-test

STOP-HERE

"any side is unequal" print
{ f } [ 2 3 2 <triangle> equilateral? ] unit-test

"no sides are equal" print
{ f } [ 5 4 6 <triangle> equilateral? ] unit-test

"all zero sides is not a triangle" print
{ f } [ 0 0 0 <triangle> equilateral? ] unit-test

"sides may be floats" print
{ t } [ 0.5 0.5 0.5 <triangle> equilateral? ] unit-test

"last two sides are equal" print
{ t } [ 3 4 4 <triangle> isosceles? ] unit-test

"first two sides are equal" print
{ t } [ 4 4 3 <triangle> isosceles? ] unit-test

"first and last sides are equal" print
{ t } [ 4 3 4 <triangle> isosceles? ] unit-test

"equilateral triangles are also isosceles" print
{ t } [ 4 4 4 <triangle> isosceles? ] unit-test

"no sides are equal" print
{ f } [ 2 3 4 <triangle> isosceles? ] unit-test

"first triangle inequality violation" print
{ f } [ 1 1 3 <triangle> isosceles? ] unit-test

"second triangle inequality violation" print
{ f } [ 1 3 1 <triangle> isosceles? ] unit-test

"third triangle inequality violation" print
{ f } [ 3 1 1 <triangle> isosceles? ] unit-test

"sides may be floats" print
{ t } [ 0.5 0.4 0.5 <triangle> isosceles? ] unit-test

"no sides are equal" print
{ t } [ 5 4 6 <triangle> scalene? ] unit-test

"all sides are equal" print
{ f } [ 4 4 4 <triangle> scalene? ] unit-test

"first and second sides are equal" print
{ f } [ 4 4 3 <triangle> scalene? ] unit-test

"first and third sides are equal" print
{ f } [ 3 4 3 <triangle> scalene? ] unit-test

"second and third sides are equal" print
{ f } [ 4 3 3 <triangle> scalene? ] unit-test

"may not violate triangle inequality" print
{ f } [ 7 3 2 <triangle> scalene? ] unit-test

"sides may be floats" print
{ t } [ 0.5 0.4 0.6 <triangle> scalene? ] unit-test
