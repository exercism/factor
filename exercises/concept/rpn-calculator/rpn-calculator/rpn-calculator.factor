USING: kernel ;
IN: rpn-calculator

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

! TASK 6: Define a zero-divisor-error error class.

: divide-op ( stack -- new-stack )
    "unimplemented" throw ;
