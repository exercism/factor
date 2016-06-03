USING: formatting kernel ;
IN: hello-world

: hello-name ( name -- string )
  dup "" = [ drop "World" ] when
  "Hello, %s!" sprintf ;
