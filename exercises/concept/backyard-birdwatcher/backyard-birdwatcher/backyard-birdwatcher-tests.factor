USING: backyard-birdwatcher tools.test ;
IN: backyard-birdwatcher.tests

! TASK: 1 today
{ 1 } [ { 2 5 0 7 4 1 } today ] unit-test
{ 4 } [ { 4 } today ] unit-test

! TASK: 2 increment-todays-count
{ { 2 5 0 7 4 2 } } [ { 2 5 0 7 4 1 } increment-todays-count ] unit-test
{ { 1 } } [ { 0 } increment-todays-count ] unit-test

! TASK: 3 has-day-without-birds?
{ t } [ { 2 5 0 7 4 1 } has-day-without-birds? ] unit-test
{ f } [ { 2 5 1 } has-day-without-birds? ] unit-test
{ f } [ { } has-day-without-birds? ] unit-test

! TASK: 4 count-for-first-days
{ 14 } [ { 2 5 0 7 4 1 } 4 count-for-first-days ] unit-test
{ 0 } [ { 2 5 0 7 4 1 } 0 count-for-first-days ] unit-test
{ 19 } [ { 2 5 0 7 4 1 } 6 count-for-first-days ] unit-test

! TASK: 5 busy-days
{ 2 } [ { 2 5 0 7 4 1 } busy-days ] unit-test
{ 0 } [ { 2 4 0 } busy-days ] unit-test
{ 4 } [ { 6 7 8 9 } busy-days ] unit-test

! TASK: 6 pad-missing-days
{ { 2 5 0 0 0 0 0 } } [ { 2 5 0 } 7 pad-missing-days ] unit-test
{ { 4 1 6 8 } } [ { 4 1 6 8 } 3 pad-missing-days ] unit-test
{ { 0 0 0 } } [ { } 3 pad-missing-days ] unit-test
