USING: arrays ascii assocs combinators forth.builtins kernel
       locals math math.parser quotations sequences splitting
       strings ;
IN: forth

ERROR: undefined-operation name ;
ERROR: illegal-operation name ;

CONSTANT: builtins H{
    { "+"    [ forth+ ] }
    { "-"    [ forth- ] }
    { "*"    [ forth* ] }
    { "/"    [ forth/ ] }
    { "dup"  [ forth-dup ] }
    { "drop" [ forth-drop ] }
    { "swap" [ forth-swap ] }
    { "over" [ forth-over ] }
}

<PRIVATE

: lower ( str -- str' ) [ ch>lower ] map ;

: tokenize ( str -- tokens )
    " " split harvest [ lower ] map ;

: integer-token? ( str -- ? ) string>number integer? ;

:: lookup ( name defs -- quot )
    name defs at [ ] [
        name builtins at [ ]
        [ name undefined-operation ] if*
    ] if* ;

:: compile-token ( token defs -- quot )
    token integer-token?
    [ token string>number [ suffix ] curry ]
    [ token defs lookup ]
    if ;

:: compile ( tokens defs -- quot )
    tokens [ defs compile-token ] map concat >quotation ;

:: process ( stack tokens defs -- stack' )
    tokens empty? [ stack ] [
        tokens first ":" = [
            tokens rest [ ";" = ] split-when first2
            :> ( body tail )
            body first lower :> name
            name integer-token? [ name illegal-operation ] when
            body rest defs compile name defs set-at
            stack tail defs process
        ] [
            stack tokens first defs compile-token call( s -- s' )
            tokens rest defs process
        ] if
    ] if ;

PRIVATE>

:: evaluate ( instructions -- stack )
    H{ } clone :> defs
    V{ } clone instructions [
        tokenize defs process
    ] each >array ;
