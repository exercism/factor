USING: arrays kernel locals math sequences ;
IN: list-ops

: list-append ( seq1 seq2 -- seq ) append ;

: list-concat ( seqs -- seq ) { } [ list-append ] reduce ;

:: select ( seq quot: ( x -- ? ) -- seq' )
    V{ } clone seq [| x | x quot call [ x over push ] when ] each >array ; inline

:: collect ( seq quot: ( x -- y ) -- seq' )
    seq length f <array> seq [| x i |
        x quot call i pick set-nth
    ] each-index ; inline

: list-length ( seq -- n ) 0 [ drop 1 + ] reduce ;

:: list-reverse ( seq -- seq' )
    seq list-length :> len
    len f <array>
    seq [| x i | x len 1 - i - pick set-nth ] each-index ;

:: foldl ( seq init quot: ( acc el -- acc' ) -- result )
    init seq [ quot call ] each ; inline

:: foldr ( seq init quot: ( acc el -- acc' ) -- result )
    init seq list-reverse [ quot call ] each ; inline
