USING: kernel ;
IN: list-ops

: list-append ( seq1 seq2 -- seq )
    "unimplemented" throw ;

: list-concat ( seqs -- seq )
    "unimplemented" throw ;

: select ( seq quot -- seq' )
    "unimplemented" throw ; inline

: collect ( seq quot -- seq' )
    "unimplemented" throw ; inline

: foldl ( seq init quot -- result )
    "unimplemented" throw ; inline

: foldr ( seq init quot -- result )
    "unimplemented" throw ; inline

: list-length ( seq -- n )
    "unimplemented" throw ;

: list-reverse ( seq -- seq' )
    "unimplemented" throw ;
