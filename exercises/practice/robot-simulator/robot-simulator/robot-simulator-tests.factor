USING: io kernel lexer robot-simulator tools.test unicode ;
IN: robot-simulator.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Robot Simulator:" print

"at origin facing north" print
{ { 0 0 "north" } }
[ 0 0 "north" <robot> ] unit-test

STOP-HERE

"at negative position facing south" print
{ { -1 -1 "south" } }
[ -1 -1 "south" <robot> ] unit-test

"changes north to east" print
{ { 0 0 "east" } }
[ 0 0 "north" <robot> "R" move ] unit-test

"changes east to south" print
{ { 0 0 "south" } }
[ 0 0 "east" <robot> "R" move ] unit-test

"changes south to west" print
{ { 0 0 "west" } }
[ 0 0 "south" <robot> "R" move ] unit-test

"changes west to north" print
{ { 0 0 "north" } }
[ 0 0 "west" <robot> "R" move ] unit-test

"changes north to west" print
{ { 0 0 "west" } }
[ 0 0 "north" <robot> "L" move ] unit-test

"changes west to south" print
{ { 0 0 "south" } }
[ 0 0 "west" <robot> "L" move ] unit-test

"changes south to east" print
{ { 0 0 "east" } }
[ 0 0 "south" <robot> "L" move ] unit-test

"changes east to north" print
{ { 0 0 "north" } }
[ 0 0 "east" <robot> "L" move ] unit-test

"facing north increments Y" print
{ { 0 1 "north" } }
[ 0 0 "north" <robot> "A" move ] unit-test

"facing south decrements Y" print
{ { 0 -1 "south" } }
[ 0 0 "south" <robot> "A" move ] unit-test

"facing east increments X" print
{ { 1 0 "east" } }
[ 0 0 "east" <robot> "A" move ] unit-test

"facing west decrements X" print
{ { -1 0 "west" } }
[ 0 0 "west" <robot> "A" move ] unit-test

"moving east and north from README" print
{ { 9 4 "west" } }
[ 7 3 "north" <robot> "RAALAL" move ] unit-test

"moving west and north" print
{ { -4 1 "west" } }
[ 0 0 "north" <robot> "LAAARALA" move ] unit-test

"moving west and south" print
{ { -3 -8 "south" } }
[ 2 -7 "east" <robot> "RRAAAAALA" move ] unit-test

"moving east and north" print
{ { 11 5 "north" } }
[ 8 4 "south" <robot> "LAAARRRALLLL" move ] unit-test
