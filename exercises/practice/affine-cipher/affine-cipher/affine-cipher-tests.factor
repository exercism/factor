USING: affine-cipher exercism-tools io kernel tools.test unicode ;
IN: affine-cipher.tests

"encode yes" description
{ "xbt" }
[ "yes" 5 7 encode ] unit-test

STOP-HERE

"encode no" description
{ "fu" }
[ "no" 15 18 encode ] unit-test

"encode OMG" description
{ "lvz" }
[ "OMG" 21 3 encode ] unit-test

"encode O M G" description
{ "hjp" }
[ "O M G" 25 47 encode ] unit-test

"encode mindblowingly" description
{ "rzcwa gnxzc dgt" }
[ "mindblowingly" 11 15 encode ] unit-test

"encode numbers" description
{ "jqgjc rw123 jqgjc rw" }
[ "Testing,1 2 3, testing." 3 4 encode ] unit-test

"encode deep thought" description
{ "iynia fdqfb ifje" }
[ "Truth is fiction." 5 17 encode ] unit-test

"encode all the letters" description
{ "swxtj npvyk lruol iejdc blaxk swxmh qzglf" }
[ "The quick brown fox jumps over the lazy dog." 17 33 encode ] unit-test

"encode with a not coprime to m" description
[ "This is a test." 6 17 encode ]
[ "a and m must be coprime." = ] must-fail-with

"decode exercism" description
{ "exercism" }
[ "tytgn fjr" 3 7 decode ] unit-test

"decode a sentence" description
{ "anobstacleisoftenasteppingstone" }
[ "qdwju nqcro muwhn odqun oppmd aunwd o" 19 16 decode ] unit-test

"decode numbers" description
{ "testing123testing" }
[ "odpoz ub123 odpoz ub" 25 7 decode ] unit-test

"decode all the letters" description
{ "thequickbrownfoxjumpsoverthelazydog" }
[ "swxtj npvyk lruol iejdc blaxk swxmh qzglf" 17 33 decode ] unit-test

"decode with no spaces in input" description
{ "thequickbrownfoxjumpsoverthelazydog" }
[ "swxtjnpvyklruoliejdcblaxkswxmhqzglf" 17 33 decode ] unit-test

"decode with too many spaces" description
{ "jollygreengiant" }
[ "vszzm    cly   yd cg    qdp" 15 16 decode ] unit-test

"decode with a not coprime to m" description
[ "Test" 13 5 decode ]
[ "a and m must be coprime." = ] must-fail-with

"encode boundary characters" description
{ "09maz nmazn" }
[ "/09:@AMNZ[`amnz{" 25 12 encode ] unit-test
