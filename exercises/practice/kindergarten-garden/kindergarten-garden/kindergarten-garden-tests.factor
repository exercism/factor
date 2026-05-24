USING: exercism-tools io kernel kindergarten-garden tools.test unicode ;
IN: kindergarten-garden.tests

"Kindergarten Garden:" print

"garden with single student" print
{ { "radishes" "clover" "grass" "grass" } }
[ "RC\nGG" "Alice" plants ] unit-test

STOP-HERE

"different garden with single student" print
{ { "violets" "clover" "radishes" "clover" } }
[ "VC\nRC" "Alice" plants ] unit-test

"garden with two students" print
{ { "clover" "grass" "radishes" "clover" } }
[ "VVCG\nVVRC" "Bob" plants ] unit-test

"second student's garden" print
{ { "clover" "clover" "clover" "clover" } }
[ "VVCCGG\nVVCCGG" "Bob" plants ] unit-test

"third student's garden" print
{ { "grass" "grass" "grass" "grass" } }
[ "VVCCGG\nVVCCGG" "Charlie" plants ] unit-test

"for Alice, first student's garden" print
{ { "violets" "radishes" "violets" "radishes" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Alice" plants ] unit-test

"for Bob, second student's garden" print
{ { "clover" "grass" "clover" "clover" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Bob" plants ] unit-test

"for Charlie" print
{ { "violets" "violets" "clover" "grass" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Charlie" plants ] unit-test

"for David" print
{ { "radishes" "violets" "clover" "radishes" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "David" plants ] unit-test

"for Eve" print
{ { "clover" "grass" "radishes" "grass" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Eve" plants ] unit-test

"for Fred" print
{ { "grass" "clover" "violets" "clover" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Fred" plants ] unit-test

"for Ginny" print
{ { "clover" "grass" "grass" "clover" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Ginny" plants ] unit-test

"for Harriet" print
{ { "violets" "radishes" "radishes" "violets" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Harriet" plants ] unit-test

"for Ileana" print
{ { "grass" "clover" "violets" "clover" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Ileana" plants ] unit-test

"for Joseph" print
{ { "violets" "clover" "violets" "grass" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Joseph" plants ] unit-test

"for Kincaid, second to last student's garden" print
{ { "grass" "clover" "clover" "grass" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Kincaid" plants ] unit-test

"for Larry, last student's garden" print
{ { "grass" "violets" "clover" "violets" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Larry" plants ] unit-test
