USING: exercism-tools io kernel saddle-points tools.test unicode ;
IN: saddle-points.tests

"Can identify single saddle point" description
{ { { 2 1 } } }
[ {
    { 9 8 7 }
    { 5 3 2 }
    { 6 6 7 }
} saddle-points ] unit-test

STOP-HERE

"Can identify that empty matrix has no saddle points" description
{ { } }
[ { {  } } saddle-points ] unit-test

"Can identify lack of saddle points when there are none" description
{ { } }
[ {
    { 1 2 3 }
    { 3 1 2 }
    { 2 3 1 }
} saddle-points ] unit-test

"Can identify multiple saddle points in a column" description
{ { { 1 2 } { 2 2 } { 3 2 } } }
[ {
    { 4 5 4 }
    { 3 5 5 }
    { 1 5 4 }
} saddle-points ] unit-test

"Can identify multiple saddle points in a row" description
{ { { 2 1 } { 2 2 } { 2 3 } } }
[ {
    { 6 7 8 }
    { 5 5 5 }
    { 7 5 6 }
} saddle-points ] unit-test

"Can identify saddle point in bottom right corner" description
{ { { 3 3 } } }
[ {
    { 8 7 9 }
    { 6 7 6 }
    { 3 2 5 }
} saddle-points ] unit-test

"Can identify saddle points in a non square matrix" description
{ { { 1 1 } { 1 3 } } }
[ {
    { 3 1 3 }
    { 3 2 4 }
} saddle-points ] unit-test

"Can identify that saddle points in a single column matrix are those with the minimum value" description
{ { { 2 1 } { 4 1 } } }
[ {
    { 2 }
    { 1 }
    { 4 }
    { 1 }
} saddle-points ] unit-test

"Can identify that saddle points in a single row matrix are those with the maximum value" description
{ { { 1 2 } { 1 4 } } }
[ { { 2 5 3 5 } } saddle-points ] unit-test
