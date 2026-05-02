USING: kernel ;
IN: rational-numbers

! Define a `rat` tuple and the words below. `<rat>` should
! reduce its arguments to lowest terms with the sign on the
! numerator.

: <rat> ( numerator denominator -- rat )
    "unimplemented" throw ;

: >rat ( pair -- rat ) "unimplemented" throw ;

: rat>pair ( rat -- pair ) "unimplemented" throw ;

: r+ ( a b -- c ) "unimplemented" throw ;
: r- ( a b -- c ) "unimplemented" throw ;
: r* ( a b -- c ) "unimplemented" throw ;
: r/ ( a b -- c ) "unimplemented" throw ;

: r-abs ( a -- |a| ) "unimplemented" throw ;

! `r^` raises a `rat` to an integer power.
: r^ ( a n -- a^n ) "unimplemented" throw ;

! `real^r` raises a real to a `rat` exponent and returns a float.
: real^r ( x a -- y ) "unimplemented" throw ;
