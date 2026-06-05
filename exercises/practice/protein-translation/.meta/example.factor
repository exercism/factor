USING: arrays assocs grouping kernel locals math sequences vectors ;
IN: protein-translation

ERROR: invalid-codon ;

CONSTANT: codon-table H{
    { "AUG" "Methionine" }
    { "UUU" "Phenylalanine" } { "UUC" "Phenylalanine" }
    { "UUA" "Leucine" } { "UUG" "Leucine" }
    { "UCU" "Serine" } { "UCC" "Serine" } { "UCA" "Serine" } { "UCG" "Serine" }
    { "UAU" "Tyrosine" } { "UAC" "Tyrosine" }
    { "UGU" "Cysteine" } { "UGC" "Cysteine" }
    { "UGG" "Tryptophan" }
    { "UAA" "STOP" } { "UAG" "STOP" } { "UGA" "STOP" }
}

: codon>protein ( codon -- protein )
    codon-table at [ invalid-codon ] unless* ;

:: proteins ( strand -- result )
    strand 3 group :> codons
    0 :> i!
    V{ } clone :> acc
    t :> going!
    [ going i codons length < and ] [
        i codons nth codon>protein
        dup "STOP" =
        [ drop f going! ]
        [ acc push i 1 + i! ] if
    ] while
    acc >array ;
