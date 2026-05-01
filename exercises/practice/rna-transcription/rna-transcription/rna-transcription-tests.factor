USING: exercism-tools io kernel rna-transcription tools.test unicode ;
IN: rna-transcription.tests

"Rna Transcription:" print

"Empty RNA sequence" print
{ "" }
[ "" to-rna ] unit-test

STOP-HERE

"RNA complement of cytosine is guanine" print
{ "G" }
[ "C" to-rna ] unit-test

"RNA complement of guanine is cytosine" print
{ "C" }
[ "G" to-rna ] unit-test

"RNA complement of thymine is adenine" print
{ "A" }
[ "T" to-rna ] unit-test

"RNA complement of adenine is uracil" print
{ "U" }
[ "A" to-rna ] unit-test

"RNA complement" print
{ "UGCACCAGAAUU" }
[ "ACGTGGTCTTAA" to-rna ] unit-test
