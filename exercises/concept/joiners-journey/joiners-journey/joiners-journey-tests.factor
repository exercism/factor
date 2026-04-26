USING: joiners-journey kernel namespaces tools.test ;
IN: joiners-journey.tests

! TASK: 1 with-kerf
{ 102 } [ 100 with-kerf ] unit-test
{ 51 } [ 50 with-kerf ] unit-test
{ 0 } [ 0 with-kerf ] unit-test

! TASK: 2 kerf-and-finish
{ 2 5 } [ 100 kerf-and-finish ] unit-test
{ 1 5/2 } [ 50 kerf-and-finish ] unit-test
{ 0 0 } [ 0 kerf-and-finish ] unit-test

! TASK: 3 cut-card
{ 100 2 5 } [ 100 cut-card ] unit-test
{ 50 1 5/2 } [ 50 cut-card ] unit-test
{ 200 4 10 } [ 200 cut-card ] unit-test

! TASK: 4 per-piece
{ 51 } [ 100 2 per-piece ] unit-test
{ 51/2 } [ 100 4 per-piece ] unit-test
{ 17 } [ 100 6 per-piece ] unit-test

! TASK: 5 compare-bolts
{ 1 2 } [ 50 100 compare-bolts ] unit-test
{ 5 4 } [ 250 200 compare-bolts ] unit-test
{ 0 0 } [ 0 0 compare-bolts ] unit-test

! TASK: 6 current-kerf
{ 2 } [ 100 current-kerf ] unit-test
{ 0 } [ 0 current-kerf ] unit-test
{ 1 } [ 1/100 kerf-factor [ 100 current-kerf ] with-variable ] unit-test
{ 5 } [ 1/20 kerf-factor [ 100 current-kerf ] with-variable ] unit-test
! Falls back to default outside the with-variable scope
{ 2 } [
    1/100 kerf-factor [ 100 current-kerf drop ] with-variable
    100 current-kerf
] unit-test
