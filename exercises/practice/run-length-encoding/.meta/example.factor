USING: grouping kernel locals math math.parser sequences
splitting.monotonic strings unicode ;
IN: run-length-encoding

: encode ( str -- encoded )
    dup empty? [ ] [
        [ = ] monotonic-split [
            dup length dup 1 > [ number>string ] [ drop "" ] if
            swap first 1string append
        ] map concat
    ] if ;

:: decode ( str -- decoded )
    "" 0 :> ( acc! n! )
    str [| ch |
        ch digit? [
            n 10 * ch CHAR: 0 - + n!
        ] [
            n 0 = [ 1 n! ] when
            acc n ch 1string <repetition> concat append acc!
            0 n!
        ] if
    ] each
    acc ;
