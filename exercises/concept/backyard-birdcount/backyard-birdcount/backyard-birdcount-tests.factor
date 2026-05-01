USING: backyard-birdcount exercism-tools tools.test ;
IN: backyard-birdcount.tests

TASK: 1 today
{ 2 } [ { 2 5 1 } today ] unit-test
{ f } [ { } today ] unit-test
{ 0 } [ { 0 } today ] unit-test

TASK: 2 increment-day-count
{ { 5 0 2 } } [ { 4 0 2 } increment-day-count ] unit-test
{ { 1 } } [ { } increment-day-count ] unit-test
{ { 1 0 } } [ { 0 0 } increment-day-count ] unit-test

TASK: 3 has-day-without-birds?
{ t } [ { 2 0 4 } has-day-without-birds? ] unit-test
{ f } [ { 3 8 1 5 } has-day-without-birds? ] unit-test
{ f } [ { } has-day-without-birds? ] unit-test
{ t } [ { 0 } has-day-without-birds? ] unit-test

TASK: 4 total
{ 18 } [ { 4 0 9 0 5 } total ] unit-test
{ 0 } [ { } total ] unit-test
{ 7 } [ { 7 } total ] unit-test

TASK: 5 busy-days
{ 2 } [ { 4 5 0 0 6 } busy-days ] unit-test
{ 0 } [ { 4 0 0 } busy-days ] unit-test
{ 0 } [ { } busy-days ] unit-test
{ 3 } [ { 5 6 7 } busy-days ] unit-test
