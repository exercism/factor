USING: grouping kernel locals math math.functions sequences
strings unicode ;
IN: crypto-square

:: ciphertext ( plaintext -- cipher )
    plaintext >lower [ [ Letter? ] [ digit? ] bi or ] filter
    :> normalized
    normalized length :> len
    len 0 = [ "" ] [
        len sqrt ceiling >integer :> cols
        normalized cols CHAR: \s pad-tail cols group :> rows
        cols <iota> [| c |
            rows [| row | c row length < [ c row nth ] [ CHAR: \s ] if ] map >string
        ] map " " join
    ] if ;
