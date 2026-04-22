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
                    stack empty? not stack ?last expected = and
                    [ stack pop* ] [ f ok! ] if
                ] when*
            ] if
        ] when
    ] each
    ok stack empty? and ;
