USING: formatting kernel sequences ;
IN: hello-world

: hello-name ( name -- string )
  dup empty? [ drop "World" ] when
  "Hello, %s!" sprintf ;
