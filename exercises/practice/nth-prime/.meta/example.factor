USING: kernel math math.primes ;
IN: nth-prime

: nth-prime ( n -- prime )
    dup 0 = [ "there is no zeroth prime" throw ] when
    1 swap [ next-prime ] times ;
