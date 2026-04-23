USING: kernel locals make sequences ;
IN: accumulate

:: accum ( seq quot: ( x -- y ) -- newseq )
    [ seq [ quot call , ] each ] { } make ; inline
