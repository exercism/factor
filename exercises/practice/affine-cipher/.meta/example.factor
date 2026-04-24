USING: combinators grouping kernel locals math math.functions
ranges sequences sets strings unicode ;
IN: affine-cipher

: check-coprime ( a -- a )
    dup 26 gcd nip 1 = [ "a and m must be coprime." throw ] unless ;

: mmi ( a -- a^-1 )
    26 [1..b] [ over * 26 mod 1 = ] find nip nip ;

: group5 ( str -- str ) 5 group " " join ;

:: encode ( phrase a b -- cipher )
    a check-coprime drop
    phrase >lower
    [ [ Letter? ] [ digit? ] bi or ] filter
    [| ch |
        ch digit?
        [ ch ]
        [ ch CHAR: a - a * b + 26 mod CHAR: a + ] if
    ] map group5 ;

:: decode ( phrase a b -- plain )
    a check-coprime mmi :> a-inv
    phrase " " without
    [| ch |
        ch digit?
        [ ch ]
        [ ch CHAR: a - b - a-inv * 26 mod dup 0 < [ 26 + ] when CHAR: a + ] if
    ] map ;
