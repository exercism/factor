USING: atbash-cipher exercism-tools io kernel tools.test unicode ;
IN: atbash-cipher.tests

"encode yes" description
{ "bvh" }
[ "yes" encode ] unit-test

STOP-HERE

"encode no" description
{ "ml" }
[ "no" encode ] unit-test

"encode OMG" description
{ "lnt" }
[ "OMG" encode ] unit-test

"encode spaces" description
{ "lnt" }
[ "O M G" encode ] unit-test

"encode mindblowingly" description
{ "nrmwy oldrm tob" }
[ "mindblowingly" encode ] unit-test

"encode numbers" description
{ "gvhgr mt123 gvhgr mt" }
[ "Testing,1 2 3, testing." encode ] unit-test

"encode deep thought" description
{ "gifgs rhurx grlm" }
[ "Truth is fiction." encode ] unit-test

"encode all the letters" description
{ "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt" }
[ "The quick brown fox jumps over the lazy dog." encode ] unit-test

"decode exercism" description
{ "exercism" }
[ "vcvix rhn" decode ] unit-test

"decode a sentence" description
{ "anobstacleisoftenasteppingstone" }
[ "zmlyh gzxov rhlug vmzhg vkkrm thglm v" decode ] unit-test

"decode numbers" description
{ "testing123testing" }
[ "gvhgr mt123 gvhgr mt" decode ] unit-test

"decode all the letters" description
{ "thequickbrownfoxjumpsoverthelazydog" }
[ "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt" decode ] unit-test

"decode with too many spaces" description
{ "exercism" }
[ "vc vix    r hn" decode ] unit-test

"decode with no spaces" description
{ "anobstacleisoftenasteppingstone" }
[ "zmlyhgzxovrhlugvmzhgvkkrmthglmv" decode ] unit-test

"encode boundary characters" description
{ "09znm aznma" }
[ "/09:@AMNZ[`amnz{" encode ] unit-test
