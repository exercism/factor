USING: kernel locals math math.order sequences strings unicode ;
IN: rotational-cipher

:: rotate-char ( ch key base -- ch' )
    ch base - key + 26 mod base + ;

:: rotate ( text key -- cipher )
    text [| ch |
        ch CHAR: a CHAR: z between? [ ch key CHAR: a rotate-char ] [
            ch CHAR: A CHAR: Z between? [ ch key CHAR: A rotate-char ] [
                ch
            ] if
        ] if
    ] map ;
