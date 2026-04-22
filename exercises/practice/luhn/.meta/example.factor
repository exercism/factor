USING: kernel locals math sequences sets strings unicode ;
IN: luhn

:: valid? ( value -- ? )
    value " " without :> stripped
    stripped length 2 < [ f ] [
        stripped [ digit? ] all? [
            stripped reverse [| ch i |
                ch CHAR: 0 -
                i odd? [
                    2 * dup 9 > [ 9 - ] when
                ] when
            ] map-index sum 10 mod 0 =
        ] [ f ] if
    ] if ;
