USING: hello-world tools.test ;
IN: hello-world.tests

! There are no variadic functions in Factor, due to the nature of the stack.
! Usually, if you need var args, use an array. Here, we'll just use an empty string.
{ "Hello, World!" } [ ""      hello-name ] unit-test
{ "Hello, Alice!" } [ "Alice" hello-name ] unit-test
{ "Hello, Bob!"   } [ "Bob"   hello-name ] unit-test