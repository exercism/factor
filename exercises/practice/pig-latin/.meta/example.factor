USING: combinators kernel math sequences splitting ;
IN: pig-latin

: vowel? ( ch -- ? )
    "aeiou" member? ;

: 2head= ( word str -- ? )
    over length 1 > [ [ 2 head ] dip = ] [ 2drop f ] if ;

: vowel-start? ( word -- ? )
    dup first vowel?
    over "xr" 2head= or
    swap "yt" 2head= or ;

:: qu-at? ( word i -- ? )
    i word nth CHAR: q =
    i 1 + dup word length <
    [ word nth CHAR: u = ] [ drop f ] if
    and ;

:: cluster ( word i -- n )
    i word length >= [ i ] [
        i word nth :> c
        {
            { [ c vowel? ] [ i ] }
            { [ c CHAR: y = i 0 > and ] [ i ] }
            { [ word i qu-at? ] [ i 2 + ] }
            [ word i 1 + cluster ]
        } cond
    ] if ;

: translate-word ( word -- result )
    dup vowel-start? [
        dup 0 cluster [ tail ] [ head ] 2bi append
    ] unless "ay" append ;

: translate ( phrase -- result )
    " " split [ translate-word ] map " " join ;
