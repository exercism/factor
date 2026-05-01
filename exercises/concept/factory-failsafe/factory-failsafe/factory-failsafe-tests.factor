USING: exercism-tools factory-failsafe kernel tools.test ;
IN: factory-failsafe.tests

TASK: 1 check-humidity
{ } [ 50 check-humidity ] unit-test
{ } [ 70 check-humidity ] unit-test
[ 80 check-humidity ] [ "humidity too high" = ] must-fail-with

TASK: 2 check-temperature
{ } [ 400 check-temperature ] unit-test
{ } [ 500 check-temperature ] unit-test
[ 600 check-temperature ] [ "temperature too high" = ] must-fail-with

TASK: 3 machine-error class
[ machine-error ] [ machine-error? ] must-fail-with

TASK: 4 monitor
{ } [ 50 400 monitor ] unit-test
[ 80 400 monitor ] [ machine-error? ] must-fail-with
[ 50 600 monitor ] [ machine-error? ] must-fail-with
[ 80 600 monitor ] [ machine-error? ] must-fail-with

TASK: 5 monitor-batch
{ 0 } [ { } monitor-batch ] unit-test
{ 0 } [ { { 50 400 } { 60 200 } } monitor-batch ] unit-test
{ 1 } [ { { 80 400 } } monitor-batch ] unit-test
{ 2 } [ { { 50 400 } { 80 400 } { 50 600 } { 60 200 } } monitor-batch ] unit-test
{ 3 } [ { { 50 400 } { 80 400 } { 50 600 } { 80 600 } { 60 200 } } monitor-batch ] unit-test
