USING: bunting-builder tools.test ;
IN: bunting-builder.tests

! TASK: 1 alphabet-bunting
{ "abcde" } [ 5 alphabet-bunting ] unit-test
{ "" } [ 0 alphabet-bunting ] unit-test
{ "abcdefghijklmnopqrstuvwxyz" } [ 26 alphabet-bunting ] unit-test

! TASK: 2 counting-bunting
{ "012345678901" } [ 12 counting-bunting ] unit-test
{ "" } [ 0 counting-bunting ] unit-test
{ "0" } [ 1 counting-bunting ] unit-test

! TASK: 3 stripe-bunting
{ "*-*-*-" } [ 6 stripe-bunting ] unit-test
{ "*" } [ 1 stripe-bunting ] unit-test
{ "" } [ 0 stripe-bunting ] unit-test

! TASK: 4 marker-bunting
{ "|....|....|" } [ 11 marker-bunting ] unit-test
{ "|" } [ 1 marker-bunting ] unit-test
{ "" } [ 0 marker-bunting ] unit-test
