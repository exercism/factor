USING: exercism-tools io kernel queen-attack tools.test unicode ;
IN: queen-attack.tests

"queen with a valid position" description
[ 2 2 <queen> drop ] must-not-fail

STOP-HERE

"queen must have positive row" description
[ -2 2 <queen> ]
[ row-not-on-board? ] must-fail-with

"queen must have row on board" description
[ 8 4 <queen> ]
[ row-not-on-board? ] must-fail-with

"queen must have positive column" description
[ 2 -2 <queen> ]
[ column-not-on-board? ] must-fail-with

"queen must have column on board" description
[ 4 8 <queen> ]
[ column-not-on-board? ] must-fail-with

"cannot attack" description
{ f } [ 2 4 <queen> 6 6 <queen> can-attack? ] unit-test

"can attack on same row" description
{ t } [ 2 4 <queen> 2 6 <queen> can-attack? ] unit-test

"can attack on same column" description
{ t } [ 4 5 <queen> 2 5 <queen> can-attack? ] unit-test

"can attack on first diagonal" description
{ t } [ 2 2 <queen> 0 4 <queen> can-attack? ] unit-test

"can attack on second diagonal" description
{ t } [ 2 2 <queen> 3 1 <queen> can-attack? ] unit-test

"can attack on third diagonal" description
{ t } [ 2 2 <queen> 1 1 <queen> can-attack? ] unit-test

"can attack on fourth diagonal" description
{ t } [ 1 7 <queen> 0 6 <queen> can-attack? ] unit-test

"cannot attack if falling diagonals are only the same when reflected across the longest falling diagonal" description
{ f } [ 4 1 <queen> 2 5 <queen> can-attack? ] unit-test
