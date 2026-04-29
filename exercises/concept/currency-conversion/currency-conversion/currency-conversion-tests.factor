USING: currency-conversion tools.test ;
IN: currency-conversion.tests

! TASK: 1 exchange-money
{ 125000.0 } [ 100000 0.8 exchange-money ] unit-test
{ 70000.0 }  [ 700000 10.0 exchange-money ] unit-test

! TASK: 2 get-change
{ 458000 } [ 463000 5000 get-change ] unit-test
{ 1130 }   [ 1250 120 get-change ] unit-test
{ 13620 }  [ 15000 1380 get-change ] unit-test

! TASK: 3 value-of-bills
{ 1280000 } [ 10000 128 value-of-bills ] unit-test
{ 18000 }   [ 50 360 value-of-bills ] unit-test
{ 40000 }   [ 200 200 value-of-bills ] unit-test

! TASK: 4 number-of-bills
{ 3 }  [ 163270 50000 number-of-bills ] unit-test
{ 54 } [ 54361 1000 number-of-bills ] unit-test

! TASK: 5 leftover-of-bills
{ 0.1 1e-8 }  [ 10.1 10 leftover-of-bills ] unit-test~
{ 1.0 1e-8 }  [ 654321.0 5 leftover-of-bills ] unit-test~
{ 1.14 1e-8 } [ 3.14 2 leftover-of-bills ] unit-test~

! TASK: 6 exchangeable-value
! Args are ( denomination budget spread exchange-rate ).
{ 8568 }          [ 1 100000 10 10.61 exchangeable-value ] unit-test
{ 1400 }          [ 40 1500 25 0.84 exchangeable-value ] unit-test
{ 0 }             [ 10000000000 470000 30 1050 exchangeable-value ] unit-test
{ 4017094016600 } [ 700 470000 30 0.00000009 exchangeable-value ] unit-test
{ 363300 }        [ 700 425.33 30 0.0009 exchangeable-value ] unit-test

! TASK: 7 safe-change
{ 7.5 } [ 127.5 120 safe-change ] unit-test
{ 0 }   [ 50 100 safe-change ] unit-test
{ 0 }   [ 100 100 safe-change ] unit-test

! TASK: 8 cap-spend
{ 30 } [ 100 30 cap-spend ] unit-test
{ 20 } [ 20 30 cap-spend ] unit-test
{ 50 } [ 50 50 cap-spend ] unit-test
