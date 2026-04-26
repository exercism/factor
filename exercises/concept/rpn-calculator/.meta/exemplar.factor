USING: assocs fry kernel math sequences ;
IN: rpn-calculator

: add-op ( stack -- new-stack )
    [ 2 head* ] [ last2 + ] bi suffix ;

: multiply-op ( stack -- new-stack )
    [ 2 head* ] [ last2 * ] bi suffix ;

: apply-op ( stack op -- new-stack )
    call( stack -- new-stack ) ;

: evaluate ( stack ops -- final-stack )
    [ apply-op ] each ;

: evaluate-named ( stack ops names -- final-stack )
    swap '[ _ at ] map evaluate ;

ERROR: zero-divisor-error ;

: divide-op ( stack -- new-stack )
    dup last 0 = [ drop zero-divisor-error ] [
        [ 2 head* ] [ last2 / ] bi suffix
    ] if ;
