USING: exercism-tools io kernel rna-transcription tools.test unicode ;
IN: rna-transcription.tests

"Empty RNA sequence" description
{ "" }
[ "" to-rna ] unit-test

STOP-HERE

"RNA complement of cytosine is guanine" description
{ "G" }
[ "C" to-rna ] unit-test

"RNA complement of guanine is cytosine" description
{ "C" }
[ "G" to-rna ] unit-test

"RNA complement of thymine is adenine" description
{ "A" }
[ "T" to-rna ] unit-test

"RNA complement of adenine is uracil" description
{ "U" }
[ "A" to-rna ] unit-test

"RNA complement" description
{ "UGCACCAGAAUU" }
[ "ACGTGGTCTTAA" to-rna ] unit-test
