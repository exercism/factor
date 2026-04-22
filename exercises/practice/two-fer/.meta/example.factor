USING: formatting kernel sequences ;
IN: two-fer

: 2-for-1 ( name -- string )
  dup empty? [ drop "you" ] when
  "One for %s, one for me." sprintf ;
