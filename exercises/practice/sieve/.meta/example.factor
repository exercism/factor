USING: arrays kernel locals math math.functions ranges sequences ;
IN: sieve

:: primes ( limit -- primes )
    limit 2 < [ V{ } ] [
        limit 1 + t <array> :> sieve
        limit sqrt >integer :> max-i
        max-i 2 >= [
            2 max-i [a..b] [| i |
                i sieve nth [
                    i i * :> j!
                    [ j limit <= ] [
                        f j sieve set-nth
                        j i + j!
                    ] while
                ] when
            ] each
        ] when
        2 limit [a..b] [ sieve nth ] filter
    ] if ;
