USING: accessors command-line io kernel lexer namespaces
       sequences system tools.test tools.test.private vocabs
       vocabs.loader ;
IN: exercism-tools

SYNTAX: STOP-HERE
    lexer get [ text>> length ] keep line<< ;

SYNTAX: TASK:
    lexer get next-line ;

: run-exercism-tests ( -- )
    command-line get first
    [ require ] [ test ] bi
    test-failures get empty?
    [ 0 exit ] [ :test-failures 1 exit ] if ;

MAIN: run-exercism-tests
