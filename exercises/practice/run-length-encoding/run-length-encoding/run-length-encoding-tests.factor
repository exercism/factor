USING: exercism-tools io kernel run-length-encoding tools.test unicode ;
IN: run-length-encoding.tests

"Run Length Encoding:" print

"empty string" print
{ "" }
[ "" encode ] unit-test

STOP-HERE

"single characters only are encoded without count" print
{ "XYZ" }
[ "XYZ" encode ] unit-test

"string with no single characters" print
{ "2A3B4C" }
[ "AABBBCCCC" encode ] unit-test

"single characters mixed with repeated characters" print
{ "12WB12W3B24WB" }
[ "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB" encode ] unit-test

"multiple whitespace mixed in string" print
{ "2 hs2q q2w2 " }
[ "  hsqq qww  " encode ] unit-test

"lowercase characters" print
{ "2a3b4c" }
[ "aabbbcccc" encode ] unit-test

"empty string" print
{ "" }
[ "" decode ] unit-test

"single characters only" print
{ "XYZ" }
[ "XYZ" decode ] unit-test

"string with no single characters" print
{ "AABBBCCCC" }
[ "2A3B4C" decode ] unit-test

"single characters with repeated characters" print
{ "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB" }
[ "12WB12W3B24WB" decode ] unit-test

"multiple whitespace mixed in string" print
{ "  hsqq qww  " }
[ "2 hs2q q2w2 " decode ] unit-test

"lowercase string" print
{ "aabbbcccc" }
[ "2a3b4c" decode ] unit-test

"encode followed by decode gives original string" print
{ "zzz ZZ  zZ" }
[ "zzz ZZ  zZ" encode decode ] unit-test

"long run encode" print
{ "123z" }
[ "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz" encode ] unit-test

"long run decode" print
{ "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz" }
[ "123z" decode ] unit-test
