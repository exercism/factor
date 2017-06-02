USING: hello-world tools.test ;
IN: two-fer.tests

! There are no variadic functions in Factor, due to the nature of the stack.
! Usually, if you need var args, use an array. Here, we'll just use an empty string.
{ "One for you, one for me."   } [ ""      2-for-1 ] unit-test
{ "One for Alice, one for me." } [ "Alice" 2-for-1 ] unit-test
{ "One for Bob, one for me."   } [ "Bob"   2-for-1 ] unit-test