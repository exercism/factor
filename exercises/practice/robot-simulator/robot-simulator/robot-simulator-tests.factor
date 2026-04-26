USING: io kernel lexer robot-simulator tools.test unicode ;
IN: robot-simulator.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Robot Simulator:" print

"at origin facing north" print
{ T{ robot { x 0 } { y 0 } { direction north } } }
[ 0 0 north <robot> ] unit-test

STOP-HERE

"at negative position facing south" print
{ T{ robot { x -1 } { y -1 } { direction south } } }
[ -1 -1 south <robot> ] unit-test

"changes north to east" print
{ T{ robot { x 0 } { y 0 } { direction east } } }
[ 0 0 north <robot> "R" move ] unit-test

"changes east to south" print
{ T{ robot { x 0 } { y 0 } { direction south } } }
[ 0 0 east <robot> "R" move ] unit-test

"changes south to west" print
{ T{ robot { x 0 } { y 0 } { direction west } } }
[ 0 0 south <robot> "R" move ] unit-test

"changes west to north" print
{ T{ robot { x 0 } { y 0 } { direction north } } }
[ 0 0 west <robot> "R" move ] unit-test

"changes north to west" print
{ T{ robot { x 0 } { y 0 } { direction west } } }
[ 0 0 north <robot> "L" move ] unit-test

"changes west to south" print
{ T{ robot { x 0 } { y 0 } { direction south } } }
[ 0 0 west <robot> "L" move ] unit-test

"changes south to east" print
{ T{ robot { x 0 } { y 0 } { direction east } } }
[ 0 0 south <robot> "L" move ] unit-test

"changes east to north" print
{ T{ robot { x 0 } { y 0 } { direction north } } }
[ 0 0 east <robot> "L" move ] unit-test

"facing north increments Y" print
{ T{ robot { x 0 } { y 1 } { direction north } } }
[ 0 0 north <robot> "A" move ] unit-test

"facing south decrements Y" print
{ T{ robot { x 0 } { y -1 } { direction south } } }
[ 0 0 south <robot> "A" move ] unit-test

"facing east increments X" print
{ T{ robot { x 1 } { y 0 } { direction east } } }
[ 0 0 east <robot> "A" move ] unit-test

"facing west decrements X" print
{ T{ robot { x -1 } { y 0 } { direction west } } }
[ 0 0 west <robot> "A" move ] unit-test

"moving east and north from README" print
{ T{ robot { x 9 } { y 4 } { direction west } } }
[ 7 3 north <robot> "RAALAL" move ] unit-test

"moving west and north" print
{ T{ robot { x -4 } { y 1 } { direction west } } }
[ 0 0 north <robot> "LAAARALA" move ] unit-test

"moving west and south" print
{ T{ robot { x -3 } { y -8 } { direction south } } }
[ 2 -7 east <robot> "RRAAAAALA" move ] unit-test

"moving east and north" print
{ T{ robot { x 11 } { y 5 } { direction north } } }
[ 8 4 south <robot> "LAAARRRALLLL" move ] unit-test
