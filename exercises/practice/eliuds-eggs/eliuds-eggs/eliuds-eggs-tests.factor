USING: eliuds-eggs io kernel lexer tools.test unicode ;
IN: eliuds-eggs.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Eliuds Eggs:" print

"0 eggs" print
{ 0 } [ 0 egg-count ] unit-test

STOP-HERE

"1 egg" print
{ 1 } [ 16 egg-count ] unit-test

"4 eggs" print
{ 4 } [ 89 egg-count ] unit-test

"13 eggs" print
{ 13 } [ 2000000000 egg-count ] unit-test
