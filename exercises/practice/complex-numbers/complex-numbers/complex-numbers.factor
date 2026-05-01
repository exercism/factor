USING: kernel ;
IN: complex-numbers

! Define a `cmplx` tuple with `real` and `imaginary` slots and
! the words below. The accessors `real>>` and `imaginary>>` come
! for free with the tuple definition.

: <cmplx> ( real imag -- cmplx ) "unimplemented" throw ;
: >cmplx ( pair -- cmplx ) "unimplemented" throw ;
: cmplx>pair ( cmplx -- pair ) "unimplemented" throw ;

: c+ ( a b -- c ) "unimplemented" throw ;
: c- ( a b -- c ) "unimplemented" throw ;
: c* ( a b -- c ) "unimplemented" throw ;
: c/ ( a b -- c ) "unimplemented" throw ;

: c-abs  ( a -- |a| ) "unimplemented" throw ;
: c-conj ( a -- a* ) "unimplemented" throw ;
: c-exp  ( z -- e^z ) "unimplemented" throw ;
