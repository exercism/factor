USING: exercism-tools io kernel protein-translation tools.test unicode ;
IN: protein-translation.tests

"Empty RNA sequence results in no proteins" description
{ { } }
[ "" proteins ] unit-test

STOP-HERE

"Methionine RNA sequence" description
{ { "Methionine" } }
[ "AUG" proteins ] unit-test

"Phenylalanine RNA sequence 1" description
{ { "Phenylalanine" } }
[ "UUU" proteins ] unit-test

"Phenylalanine RNA sequence 2" description
{ { "Phenylalanine" } }
[ "UUC" proteins ] unit-test

"Leucine RNA sequence 1" description
{ { "Leucine" } }
[ "UUA" proteins ] unit-test

"Leucine RNA sequence 2" description
{ { "Leucine" } }
[ "UUG" proteins ] unit-test

"Serine RNA sequence 1" description
{ { "Serine" } }
[ "UCU" proteins ] unit-test

"Serine RNA sequence 2" description
{ { "Serine" } }
[ "UCC" proteins ] unit-test

"Serine RNA sequence 3" description
{ { "Serine" } }
[ "UCA" proteins ] unit-test

"Serine RNA sequence 4" description
{ { "Serine" } }
[ "UCG" proteins ] unit-test

"Tyrosine RNA sequence 1" description
{ { "Tyrosine" } }
[ "UAU" proteins ] unit-test

"Tyrosine RNA sequence 2" description
{ { "Tyrosine" } }
[ "UAC" proteins ] unit-test

"Cysteine RNA sequence 1" description
{ { "Cysteine" } }
[ "UGU" proteins ] unit-test

"Cysteine RNA sequence 2" description
{ { "Cysteine" } }
[ "UGC" proteins ] unit-test

"Tryptophan RNA sequence" description
{ { "Tryptophan" } }
[ "UGG" proteins ] unit-test

"STOP codon RNA sequence 1" description
{ { } }
[ "UAA" proteins ] unit-test

"STOP codon RNA sequence 2" description
{ { } }
[ "UAG" proteins ] unit-test

"STOP codon RNA sequence 3" description
{ { } }
[ "UGA" proteins ] unit-test

"Sequence of two protein codons translates into proteins" description
{ { "Phenylalanine" "Phenylalanine" } }
[ "UUUUUU" proteins ] unit-test

"Sequence of two different protein codons translates into proteins" description
{ { "Leucine" "Leucine" } }
[ "UUAUUG" proteins ] unit-test

"Translate RNA strand into correct protein list" description
{ { "Methionine" "Phenylalanine" "Tryptophan" } }
[ "AUGUUUUGG" proteins ] unit-test

"Translation stops if STOP codon at beginning of sequence" description
{ { } }
[ "UAGUGG" proteins ] unit-test

"Translation stops if STOP codon at end of two-codon sequence" description
{ { "Tryptophan" } }
[ "UGGUAG" proteins ] unit-test

"Translation stops if STOP codon at end of three-codon sequence" description
{ { "Methionine" "Phenylalanine" } }
[ "AUGUUUUAA" proteins ] unit-test

"Translation stops if STOP codon in middle of three-codon sequence" description
{ { "Tryptophan" } }
[ "UGGUAGUGG" proteins ] unit-test

"Translation stops if STOP codon in middle of six-codon sequence" description
{ { "Tryptophan" "Cysteine" "Tyrosine" } }
[ "UGGUGUUAUUAAUGGUUU" proteins ] unit-test

"Sequence of two non-STOP codons does not translate to a STOP codon" description
{ { "Methionine" "Methionine" } }
[ "AUGAUG" proteins ] unit-test

"Unknown amino acids, not part of a codon, can't translate" description
[ "XYZ" proteins ] [ invalid-codon? ] must-fail-with

"Incomplete RNA sequence can't translate" description
[ "AUGU" proteins ] [ invalid-codon? ] must-fail-with

"Incomplete RNA sequence can translate if valid until a STOP codon" description
{ { "Phenylalanine" "Phenylalanine" } }
[ "UUCUUCUAAUGGU" proteins ] unit-test
