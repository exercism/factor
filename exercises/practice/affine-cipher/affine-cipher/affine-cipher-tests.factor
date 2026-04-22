USING: affine-cipher io kernel lexer tools.test unicode ;
IN: affine-cipher.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Affine Cipher:" print

"encode yes" print
{ "xbt" }
[ "yes" 5 7 encode ] unit-test

STOP-HERE

"encode no" print
{ "fu" }
[ "no" 15 18 encode ] unit-test

"encode OMG" print
{ "lvz" }
[ "OMG" 21 3 encode ] unit-test

"encode O M G" print
{ "hjp" }
[ "O M G" 25 47 encode ] unit-test

"encode mindblowingly" print
{ "rzcwa gnxzc dgt" }
[ "mindblowingly" 11 15 encode ] unit-test

"encode numbers" print
{ "jqgjc rw123 jqgjc rw" }
[ "Testing,1 2 3, testing." 3 4 encode ] unit-test

"encode deep thought" print
{ "iynia fdqfb ifje" }
[ "Truth is fiction." 5 17 encode ] unit-test

"encode all the letters" print
{ "swxtj npvyk lruol iejdc blaxk swxmh qzglf" }
[ "The quick brown fox jumps over the lazy dog." 17 33 encode ] unit-test

"encode with a not coprime to m" print
[ "This is a test." 6 17 encode ]
[ "a and m must be coprime." = ] must-fail-with

"decode exercism" print
{ "exercism" }
[ "tytgn fjr" 3 7 decode ] unit-test

"decode a sentence" print
{ "anobstacleisoftenasteppingstone" }
[ "qdwju nqcro muwhn odqun oppmd aunwd o" 19 16 decode ] unit-test

"decode numbers" print
{ "testing123testing" }
[ "odpoz ub123 odpoz ub" 25 7 decode ] unit-test

"decode all the letters" print
{ "thequickbrownfoxjumpsoverthelazydog" }
[ "swxtj npvyk lruol iejdc blaxk swxmh qzglf" 17 33 decode ] unit-test

"decode with no spaces in input" print
{ "thequickbrownfoxjumpsoverthelazydog" }
[ "swxtjnpvyklruoliejdcblaxkswxmhqzglf" 17 33 decode ] unit-test

"decode with too many spaces" print
{ "jollygreengiant" }
[ "vszzm    cly   yd cg    qdp" 15 16 decode ] unit-test

"decode with a not coprime to m" print
[ "Test" 13 5 decode ]
[ "a and m must be coprime." = ] must-fail-with

"encode boundary characters" print
{ "09maz nmazn" }
[ "/09:@AMNZ[`amnz{" 25 12 encode ] unit-test
