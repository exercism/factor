USING: kernel ;
IN: circular-buffer

: <circular-buffer> ( capacity -- buffer )
    "unimplemented" throw ;

: write ( item buffer -- )
    "unimplemented" throw ;

: read ( buffer -- item )
    "unimplemented" throw ;

: overwrite ( item buffer -- )
    "unimplemented" throw ;

: clear-buffer ( buffer -- )
    "unimplemented" throw ;
