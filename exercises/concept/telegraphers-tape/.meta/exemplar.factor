USING: accessors destructors io kernel locals sequences ;
IN: telegraphers-tape

TUPLE: tape < disposable wire ;
INSTANCE: tape input-stream

: <tape> ( wire -- tape )
    tape new-disposable swap >>wire ;

<PRIVATE
: morse-symbol? ( elt -- ? )
    B{ CHAR: . CHAR: - CHAR: \s } member? ;
PRIVATE>

M:: tape stream-read1 ( tape -- elt/f )
    tape wire>> stream-read1 :> b
    b [
        b morse-symbol? [ b ] [ tape stream-read1 ] if
    ] [ f ] if ;

M: tape stream-element-type wire>> stream-element-type ;

M: tape dispose* wire>> dispose ;
