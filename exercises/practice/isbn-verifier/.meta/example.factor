USING: combinators kernel locals math sequences sets strings unicode ;
IN: isbn-verifier

:: valid? ( isbn -- ? )
    isbn "-" without :> stripped
    stripped length 10 = [
        stripped 9 head [ digit? ] all? [
            stripped last { { CHAR: X [ 10 ] } [ CHAR: 0 - ] } case :> check
            check 0 >= check 10 <= and [
                stripped 9 head [| ch i | ch CHAR: 0 - 10 i - * ] map-index sum
                check + 11 mod 0 =
            ] [ f ] if
        ] [ f ] if
    ] [ f ] if ;
