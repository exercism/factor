USING: eliuds-eggs exercism-tools io kernel tools.test unicode ;
IN: eliuds-eggs.tests

"0 eggs" description
{ 0 } [ 0 egg-count ] unit-test

STOP-HERE

"1 egg" description
{ 1 } [ 16 egg-count ] unit-test

"4 eggs" description
{ 4 } [ 89 egg-count ] unit-test

"13 eggs" description
{ 13 } [ 2000000000 egg-count ] unit-test
