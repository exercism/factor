USING: hello-world io kernel lexer tools.test unicode ;
IN: hello-world.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

{ "Hello, World!" } [ say-hello ] unit-test

STOP-HERE
