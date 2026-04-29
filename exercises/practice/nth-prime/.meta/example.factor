USING: kernel math math.primes ;
IN: nth-prime

: after-prime ( n -- p )
    1 + dup prime? [ after-prime ] unless ;

: nth-prime ( n -- prime )
    dup 0 = [ "there is no zeroth prime" throw ] when
    1 swap [ after-prime ] times ;
