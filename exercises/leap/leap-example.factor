USING: formatting kernel math ;
IN: leap

: my-leap-year? ( year -- leap-year? )
  dup odd?
  [ drop f ]
  [ dup [ 100 mod 0 > ] [ 400 mod zero? ] bi or
    [ 4 mod zero? ] dip and
  ] if ;
