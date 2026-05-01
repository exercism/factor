USING: exercism-tools io kernel tools.test two-fer unicode ;
IN: two-fer.tests

"Two Fer:" print

"no name given" print
{ "One for you, one for me." } [ f 2-for-1 ] unit-test

STOP-HERE

"a name given" print
{ "One for Alice, one for me." } [ "Alice" 2-for-1 ] unit-test

"another name given" print
{ "One for Bob, one for me." } [ "Bob" 2-for-1 ] unit-test
