USING: exercism-tools io kernel roman-numerals tools.test unicode ;
IN: roman-numerals.tests

"1 is I" description
{ "I" } [ 1 roman ] unit-test

STOP-HERE

"2 is II" description
{ "II" } [ 2 roman ] unit-test

"3 is III" description
{ "III" } [ 3 roman ] unit-test

"4 is IV" description
{ "IV" } [ 4 roman ] unit-test

"5 is V" description
{ "V" } [ 5 roman ] unit-test

"6 is VI" description
{ "VI" } [ 6 roman ] unit-test

"9 is IX" description
{ "IX" } [ 9 roman ] unit-test

"16 is XVI" description
{ "XVI" } [ 16 roman ] unit-test

"27 is XXVII" description
{ "XXVII" } [ 27 roman ] unit-test

"48 is XLVIII" description
{ "XLVIII" } [ 48 roman ] unit-test

"49 is XLIX" description
{ "XLIX" } [ 49 roman ] unit-test

"59 is LIX" description
{ "LIX" } [ 59 roman ] unit-test

"66 is LXVI" description
{ "LXVI" } [ 66 roman ] unit-test

"93 is XCIII" description
{ "XCIII" } [ 93 roman ] unit-test

"141 is CXLI" description
{ "CXLI" } [ 141 roman ] unit-test

"163 is CLXIII" description
{ "CLXIII" } [ 163 roman ] unit-test

"166 is CLXVI" description
{ "CLXVI" } [ 166 roman ] unit-test

"402 is CDII" description
{ "CDII" } [ 402 roman ] unit-test

"575 is DLXXV" description
{ "DLXXV" } [ 575 roman ] unit-test

"666 is DCLXVI" description
{ "DCLXVI" } [ 666 roman ] unit-test

"911 is CMXI" description
{ "CMXI" } [ 911 roman ] unit-test

"1024 is MXXIV" description
{ "MXXIV" } [ 1024 roman ] unit-test

"1666 is MDCLXVI" description
{ "MDCLXVI" } [ 1666 roman ] unit-test

"3000 is MMM" description
{ "MMM" } [ 3000 roman ] unit-test

"3001 is MMMI" description
{ "MMMI" } [ 3001 roman ] unit-test

"3888 is MMMDCCCLXXXVIII" description
{ "MMMDCCCLXXXVIII" } [ 3888 roman ] unit-test

"3999 is MMMCMXCIX" description
{ "MMMCMXCIX" } [ 3999 roman ] unit-test
