USING: kernel math ;
IN: darts

: score ( x y -- n )
    [ sq ] bi@ +
    dup 1.0 <= [ drop 10 ] [
        dup 25.0 <= [ drop 5 ] [
            100.0 <= 1 0 ?
        ] if
    ] if ;
