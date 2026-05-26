USING: exercism-tools io kernel run-length-encoding tools.test unicode ;
IN: run-length-encoding.tests

"empty string" description
{ "" }
[ "" encode ] unit-test

STOP-HERE

"single characters only are encoded without count" description
{ "XYZ" }
[ "XYZ" encode ] unit-test

"string with no single characters" description
{ "2A3B4C" }
[ "AABBBCCCC" encode ] unit-test

"single characters mixed with repeated characters" description
{ "12WB12W3B24WB" }
[ "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB" encode ] unit-test

"multiple whitespace mixed in string" description
{ "2 hs2q q2w2 " }
[ "  hsqq qww  " encode ] unit-test

"lowercase characters" description
{ "2a3b4c" }
[ "aabbbcccc" encode ] unit-test

"empty string" description
{ "" }
[ "" decode ] unit-test

"single characters only" description
{ "XYZ" }
[ "XYZ" decode ] unit-test

"string with no single characters" description
{ "AABBBCCCC" }
[ "2A3B4C" decode ] unit-test

"single characters with repeated characters" description
{ "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB" }
[ "12WB12W3B24WB" decode ] unit-test

"multiple whitespace mixed in string" description
{ "  hsqq qww  " }
[ "2 hs2q q2w2 " decode ] unit-test

"lowercase string" description
{ "aabbbcccc" }
[ "2a3b4c" decode ] unit-test

"encode followed by decode gives original string" description
{ "zzz ZZ  zZ" }
[ "zzz ZZ  zZ" encode decode ] unit-test

"long run encode" description
{ "123z" }
[ "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz" encode ] unit-test

"long run decode" description
{ "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz" }
[ "123z" decode ] unit-test
