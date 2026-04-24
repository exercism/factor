USING: assocs hashtables kernel locals math sequences splitting
strings unicode ;
IN: word-count

: word-char? ( ch -- ? )
    dup Letter? over digit? or swap CHAR: ' = or ;

:: strip-apostrophes ( str -- str' )
    str dup empty? not [
        dup first CHAR: ' = [ rest ] when
        dup empty? not [ dup last CHAR: ' = [ but-last ] when ] when
    ] when ;

:: count-words ( sentence -- counts )
    H{ } clone :> result
    sentence >lower
    [ word-char? not ] split-when
    [ empty? not ] filter
    [ strip-apostrophes ] map
    [ empty? not ] filter
    [| word |
        word result at 0 or 1 + word result set-at
    ] each
    result ;
