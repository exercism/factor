USING: exercism-tools io kernel kindergarten-garden tools.test unicode ;
IN: kindergarten-garden.tests

"garden with single student" description
{ { "radishes" "clover" "grass" "grass" } }
[ "RC\nGG" "Alice" plants ] unit-test

STOP-HERE

"different garden with single student" description
{ { "violets" "clover" "radishes" "clover" } }
[ "VC\nRC" "Alice" plants ] unit-test

"garden with two students" description
{ { "clover" "grass" "radishes" "clover" } }
[ "VVCG\nVVRC" "Bob" plants ] unit-test

"second student's garden" description
{ { "clover" "clover" "clover" "clover" } }
[ "VVCCGG\nVVCCGG" "Bob" plants ] unit-test

"third student's garden" description
{ { "grass" "grass" "grass" "grass" } }
[ "VVCCGG\nVVCCGG" "Charlie" plants ] unit-test

"for Alice, first student's garden" description
{ { "violets" "radishes" "violets" "radishes" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Alice" plants ] unit-test

"for Bob, second student's garden" description
{ { "clover" "grass" "clover" "clover" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Bob" plants ] unit-test

"for Charlie" description
{ { "violets" "violets" "clover" "grass" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Charlie" plants ] unit-test

"for David" description
{ { "radishes" "violets" "clover" "radishes" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "David" plants ] unit-test

"for Eve" description
{ { "clover" "grass" "radishes" "grass" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Eve" plants ] unit-test

"for Fred" description
{ { "grass" "clover" "violets" "clover" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Fred" plants ] unit-test

"for Ginny" description
{ { "clover" "grass" "grass" "clover" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Ginny" plants ] unit-test

"for Harriet" description
{ { "violets" "radishes" "radishes" "violets" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Harriet" plants ] unit-test

"for Ileana" description
{ { "grass" "clover" "violets" "clover" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Ileana" plants ] unit-test

"for Joseph" description
{ { "violets" "clover" "violets" "grass" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Joseph" plants ] unit-test

"for Kincaid, second to last student's garden" description
{ { "grass" "clover" "clover" "grass" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Kincaid" plants ] unit-test

"for Larry, last student's garden" description
{ { "grass" "violets" "clover" "violets" } }
[ "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Larry" plants ] unit-test
