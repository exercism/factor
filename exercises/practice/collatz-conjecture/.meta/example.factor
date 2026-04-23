USING: kernel math ;
IN: collatz-conjecture

: steps ( n -- steps )
    dup 0 > [ "Only positive integers are allowed" throw ] unless
    0 swap [ dup 1 > ]
    [ dup even? [ 2 / ] [ 3 * 1 + ] if [ 1 + ] dip ] while
    drop ;
