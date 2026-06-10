USING: accessors io.encodings.utf8 io.files kernel locals math
       math.parser sequences unicode ;
IN: grep

:: line-matches? ( line pattern i? v? x? -- ? )
    i? [ line >lower ] [ line ] if :> text
    i? [ pattern >lower ] [ pattern ] if :> pat
    x? [ text pat = ] [ text pat subseq-index ] if
    v? [ not ] when ;

: prefix-field ( str field -- str' ) swap ":" glue ;

:: format-line ( line lineno n? multi? file -- str )
    line
    n? [ lineno number>string prefix-field ] when
    multi? [ file prefix-field ] when ;

:: grep ( pattern flags files -- lines )
    "-n" flags member? :> n?
    "-l" flags member? :> l?
    "-i" flags member? :> i?
    "-v" flags member? :> v?
    "-x" flags member? :> x?
    files length 1 > :> multi?
    files [| file |
        file utf8 file-lines :> all-lines
        l? [
            all-lines [ pattern i? v? x? line-matches? ] any?
            [ { file } ] [ { } ] if
        ] [
            all-lines [| line idx |
                line pattern i? v? x? line-matches?
                [ line idx 1 + n? multi? file format-line ] [ f ] if
            ] map-index sift
        ] if
    ] map concat ;
