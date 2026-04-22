USING: atbash-cipher io kernel lexer tools.test unicode ;
IN: atbash-cipher.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Atbash Cipher:" print

"encode yes" print
{ "bvh" }
[ "yes" encode ] unit-test

STOP-HERE

"encode no" print
{ "ml" }
[ "no" encode ] unit-test

"encode OMG" print
{ "lnt" }
[ "OMG" encode ] unit-test

"encode spaces" print
{ "lnt" }
[ "O M G" encode ] unit-test

"encode mindblowingly" print
{ "nrmwy oldrm tob" }
[ "mindblowingly" encode ] unit-test

"encode numbers" print
{ "gvhgr mt123 gvhgr mt" }
[ "Testing,1 2 3, testing." encode ] unit-test

"encode deep thought" print
{ "gifgs rhurx grlm" }
[ "Truth is fiction." encode ] unit-test

"encode all the letters" print
{ "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt" }
[ "The quick brown fox jumps over the lazy dog." encode ] unit-test

"decode exercism" print
{ "exercism" }
[ "vcvix rhn" decode ] unit-test

"decode a sentence" print
{ "anobstacleisoftenasteppingstone" }
[ "zmlyh gzxov rhlug vmzhg vkkrm thglm v" decode ] unit-test

"decode numbers" print
{ "testing123testing" }
[ "gvhgr mt123 gvhgr mt" decode ] unit-test

"decode all the letters" print
{ "thequickbrownfoxjumpsoverthelazydog" }
[ "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt" decode ] unit-test

"decode with too many spaces" print
{ "exercism" }
[ "vc vix    r hn" decode ] unit-test

"decode with no spaces" print
{ "anobstacleisoftenasteppingstone" }
[ "zmlyhgzxovrhlugvmzhgvkkrmthglmv" decode ] unit-test

"encode boundary characters" print
{ "09znm aznma" }
[ "/09:@AMNZ[`amnz{" encode ] unit-test
