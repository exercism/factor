USING: cars-assemble exercism-tools tools.test ;
IN: cars-assemble.tests

TASK: 1 success-rate
{ 0.0 }  [ 0 success-rate ] unit-test
{ 1.0 }  [ 1 success-rate ] unit-test
{ 1.0 }  [ 4 success-rate ] unit-test
{ 0.9 }  [ 5 success-rate ] unit-test
{ 0.8 }  [ 9 success-rate ] unit-test
{ 0.77 } [ 10 success-rate ] unit-test

TASK: 2 production-rate-per-hour
{ 0.0 }    [ 0 production-rate-per-hour ] unit-test
{ 221.0 }  [ 1 production-rate-per-hour ] unit-test
{ 884.0 }  [ 4 production-rate-per-hour ] unit-test
{ 994.5 }  [ 5 production-rate-per-hour ] unit-test
{ 1193.4 } [ 6 production-rate-per-hour ] unit-test
{ 1591.2 } [ 9 production-rate-per-hour ] unit-test
{ 1701.7 } [ 10 production-rate-per-hour ] unit-test

TASK: 3 working-items-per-minute
{ 0 }  [ 0 working-items-per-minute ] unit-test
{ 14 } [ 4 working-items-per-minute ] unit-test
{ 19 } [ 6 working-items-per-minute ] unit-test
{ 28 } [ 10 working-items-per-minute ] unit-test
