USING: kernel macros quotations sequences ;
IN: signal-stencils

MACRO: twice ( quot -- compound )
    dup append ;

MACRO: repeat-quot ( quot n -- compound )
    swap <repetition> concat >quotation ;

MACRO: compose-many ( array -- compound )
    concat >quotation ;

MACRO: each-literal ( seq quot -- compound )
    [ curry ] curry map concat >quotation ;
