USING: kernel sequences strings unicode ;
IN: bob

: silence? ( str -- ? ) [ blank? ] all? ;
: shouting? ( str -- ? ) dup [ Letter? ] any? [ dup >upper = ] [ drop f ] if ;
: question? ( str -- ? ) [ blank? not ] find-last nip [ CHAR: ? = ] [ f ] if* ;

: response ( str -- str )
    dup silence? [ drop "Fine. Be that way!" ] [
        dup shouting? [
            question? [ "Calm down, I know what I'm doing!" ]
            [ "Whoa, chill out!" ] if
        ] [
            question? [ "Sure." ] [ "Whatever." ] if
        ] if
    ] if ;
