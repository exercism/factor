USING: combinators kernel sequences strings ;
IN: rna-transcription

: to-rna ( dna -- rna )
    [ { { CHAR: G [ CHAR: C ] }
        { CHAR: C [ CHAR: G ] }
        { CHAR: T [ CHAR: A ] }
        { CHAR: A [ CHAR: U ] } } case ] map ;
