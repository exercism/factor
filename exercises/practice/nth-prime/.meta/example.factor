USING: kernel math math.primes typed ;
IN: nth-prime

: after-prime ( n -- p )
    1 + dup prime? [ after-prime ] unless ;

TYPED:: nth-prime ( n: integer -- prime: integer )
    n 0 = [ "there is no zeroth prime" throw ] when
    1 n [ after-prime ] times ;
