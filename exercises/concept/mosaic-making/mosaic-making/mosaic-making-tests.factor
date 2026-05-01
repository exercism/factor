USING: exercism-tools mosaic-making tools.test ;
IN: mosaic-making.tests

TASK: 1 tile-strip
{ { "sky-blue" } } [ "sky-blue" tile-strip ] unit-test

STOP-HERE

{ { "red" } }      [ "red" tile-strip ] unit-test

TASK: 2 row-of-three
{ { "red" "white" "blue" } } [ "red" "white" "blue" row-of-three ] unit-test
{ { 1 2 3 } }                [ 1 2 3 row-of-three ] unit-test

TASK: 3 combine-rows
{ { "red" "white" "blue" "red" } }
[ { { "red" "white" } { "blue" "red" } } combine-rows ] unit-test
{ { } } [ { } combine-rows ] unit-test
{ { "a" "b" "c" } }
[ { { "a" } { } { "b" "c" } } combine-rows ] unit-test

TASK: 4 mirror-row
{ { "blue" "white" "red" } } [ { "red" "white" "blue" } mirror-row ] unit-test
{ { } } [ { } mirror-row ] unit-test
{ { 1 } } [ { 1 } mirror-row ] unit-test

TASK: 5 tile-position
{ 1 } [ { "red" "white" "blue" } "white" tile-position ] unit-test
{ 0 } [ { "red" "white" "blue" } "red" tile-position ] unit-test
{ f } [ { "red" "white" "blue" } "green" tile-position ] unit-test

TASK: 6 has-colour?
{ t } [ { "red" "white" "blue" } "white" has-colour? ] unit-test
{ f } [ { "red" "white" "blue" } "green" has-colour? ] unit-test
{ f } [ { } "red" has-colour? ] unit-test
