USING: formatting kernel math ;
IN: leap

: leap-year? ( year -- ? )
    dup odd? [ drop f ] [
        [ 4 mod zero? ] [ 100 mod 0 > ] [ 400 mod zero? ] tri or and
    ] if ;
