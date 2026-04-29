USING: combinators kernel locals sequences ;
IN: matching-brackets

: opener ( ch -- opener/f )
    { { CHAR: ) [ CHAR: ( ] }
      { CHAR: ] [ CHAR: [ ] }
      { CHAR: } [ CHAR: { ] }
      [ drop f ] } case ;

:: paired? ( str -- ? )
    V{ } clone :> stack
    t :> ok!
    str [| ch |
        ok [
            ch "([{" member? [ ch stack push ] [
                ch opener [| expected |
                    stack empty? [ f ] [ stack last expected = ] if
                    [ stack pop* ] [ f ok! ] if
                ] [ ] if*
            ] if
        ] when
    ] each
    ok stack empty? and ;
