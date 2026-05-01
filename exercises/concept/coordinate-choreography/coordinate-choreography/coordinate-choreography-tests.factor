USING: coordinate-choreography exercism-tools tools.test ;
IN: coordinate-choreography.tests

TASK: 1 translate-2d
{ { 6 8 } } [ { 4 8 } 2 0 translate-2d apply-transformation ] unit-test

STOP-HERE

{ { 4 8 } } [ { 4 8 } 0 0 translate-2d apply-transformation ] unit-test
{ { -3 5 } } [ { 0 0 } -3 5 translate-2d apply-transformation ] unit-test

TASK: 2 scale-2d
{ { 12 -6 } } [ { 6 -3 } 2 2 scale-2d apply-transformation ] unit-test
{ { 0 0 } } [ { 6 -3 } 0 0 scale-2d apply-transformation ] unit-test
{ { 6 -3 } } [ { 6 -3 } 1 1 scale-2d apply-transformation ] unit-test

TASK: 3 compose-transformations
{ { 4 2 } } [
    { 0 1 } 2 0 translate-2d 2 2 scale-2d compose-transformations
    apply-transformation
] unit-test

{ { 2 2 } } [
    { 0 1 } 2 2 scale-2d 2 0 translate-2d compose-transformations
    apply-transformation
] unit-test

TASK: 4 apply-transformation
{ { 6 8 } } [ { 4 8 } 2 0 translate-2d apply-transformation ] unit-test

TASK: 5 affine-2d
{ { 5 11 } } [ { 1 2 } 1 2 3 4 affine-2d apply-transformation ] unit-test
{ { 0 0 } } [ { 1 2 } 0 0 0 0 affine-2d apply-transformation ] unit-test
{ { 3 4 } } [ { 3 4 } 1 0 0 1 affine-2d apply-transformation ] unit-test
{ { -4 3 } } [ { 3 4 } 0 -1 1 0 affine-2d apply-transformation ] unit-test

TASK: 6 transform-points
{ { } } [ { } 2 0 translate-2d transform-points ] unit-test
{ { { 1 0 } { 2 1 } { 3 2 } } } [
    { { 0 0 } { 1 1 } { 2 2 } } 1 0 translate-2d transform-points
] unit-test
{ { { 6 -3 } { 0 0 } { 12 6 } } } [
    { { 3 -1 } { 0 0 } { 6 2 } } 2 3 scale-2d transform-points
] unit-test
