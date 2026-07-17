USING: combinators kernel math sequences ;
IN: secret-handshake

CONSTANT: actions { "wink" "double blink" "close your eyes" "jump" }

: commands ( number -- actions )
    [ actions swap [ swap bit? [ ] [ drop f ] if ] curry map-index sift ]
    [ 4 bit? ]
    bi
    [ reverse ] when ;
