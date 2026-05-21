USING: kernel ;
IN: rpn-calculator

ERROR: zero-divisor-error ;

: add-op ( stack -- new-stack )
    "unimplemented" throw ;

: multiply-op ( stack -- new-stack )
    "unimplemented" throw ;

: apply-op ( stack op -- new-stack )
    "unimplemented" throw ;

: evaluate ( stack ops -- final-stack )
    "unimplemented" throw ;

: evaluate-named ( stack ops names -- final-stack )
    "unimplemented" throw ;

: divide-op ( stack -- new-stack )
    "unimplemented" throw ;
