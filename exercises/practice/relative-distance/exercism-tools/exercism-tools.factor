USING: accessors command-line continuations debugger io kernel
       lexer namespaces sequences source-files.errors.debugger
       system tools.test vocabs vocabs.loader ;
IN: exercism-tools

SYNTAX: STOP-HERE
    lexer get [ text>> length ] keep line<< ;

SYNTAX: TASK:
    lexer get next-line ;

! Label the test that follows with its description. The marker lets the
! wrapper strip this line from captured output and attach it to the next
! test as a name, rather than leaving it in the previous test's output.
: description ( str -- )
    "###DESC### " write print ;

! Print one failure block in a stable, parser-friendly form. Bracketed by
! markers so a wrapper can split the stream reliably and avoid Factor's
! noisy callstack output (which is interleaved with subsequent failures).
:: print-failure ( failure -- )
    "###FAIL_BEGIN###" print
    failure error-location print
    failure error>> [ error. ] [ 2drop ] recover
    "###FAIL_END###" print
    flush ;

: print-failures ( -- )
    test-failures get [ print-failure ] each ;

: run-exercism-tests ( -- )
    command-line get first
    [ require ] [ test ] bi
    test-failures get empty?
    [ 0 exit ] [ print-failures 1 exit ] if ;

MAIN: run-exercism-tests
