USING: exercism-tools io kernel nucleotide-count tools.test unicode ;
IN: nucleotide-count.tests

"empty strand" description
{ H{ { "A" 0 } { "T" 0 } { "C" 0 } { "G" 0 } } }
[ "" nucleotide-counts ] unit-test

STOP-HERE

"can count one nucleotide in single-character input" description
{ H{ { "A" 0 } { "T" 0 } { "C" 0 } { "G" 1 } } }
[ "G" nucleotide-counts ] unit-test

"strand with repeated nucleotide" description
{ H{ { "A" 0 } { "T" 0 } { "C" 0 } { "G" 7 } } }
[ "GGGGGGG" nucleotide-counts ] unit-test

"strand with multiple nucleotides" description
{ H{ { "A" 20 } { "T" 21 } { "C" 12 } { "G" 17 } } }
[ "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC" nucleotide-counts ] unit-test

"strand with invalid nucleotides" description
[ "AGXXACT" nucleotide-counts ] [ invalid-nucleotide? ] must-fail-with
