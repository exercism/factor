USING: accessors command-line continuations debugger io kernel
       lexer namespaces prettyprint.config sequences
       source-files.errors.debugger system tools.test vocabs
       vocabs.loader ;
IN: exercism-tools

SYNTAX: STOP-HERE
    lexer get [ text>> length ] keep line<< ;

SYNTAX: TASK:
    lexer get next-line ;

! Label the test that follows with its description.
: description ( str -- )
    "###DESC### " write print ;

! Print one failure block in a stable, parser-friendly form.
:: print-failure ( failure -- )
    "###FAIL_BEGIN###" print
    failure error-location print
    [ failure error>> [ error. ] [ 2drop ] recover ] without-limits
    "###FAIL_END###" print
    flush ;

: print-failures ( -- )
    test-failures get [ print-failure ] each ;

: run-exercism-tests ( -- )
    vocab-roots [ "." prefix ] change-global
    command-line get first
    [ require ] [ test ] bi
    test-failures get empty?
    [ 0 exit ] [ print-failures 1 exit ] if ;

MAIN: run-exercism-tests
