USING: exercism-tools io kernel sequences tools.test unicode variable-length-quantity ;
IN: variable-length-quantity.tests

"zero" description
{ { 0 } }
[ { 0 } encode ] unit-test

STOP-HERE

"arbitrary single byte" description
{ { 64 } }
[ { 64 } encode ] unit-test

"asymmetric single byte" description
{ { 83 } }
[ { 83 } encode ] unit-test

"largest single byte" description
{ { 127 } }
[ { 127 } encode ] unit-test

"smallest double byte" description
{ { 129 0 } }
[ { 128 } encode ] unit-test

"arbitrary double byte" description
{ { 192 0 } }
[ { 8192 } encode ] unit-test

"asymmetric double byte" description
{ { 129 45 } }
[ { 173 } encode ] unit-test

"largest double byte" description
{ { 255 127 } }
[ { 16383 } encode ] unit-test

"smallest triple byte" description
{ { 129 128 0 } }
[ { 16384 } encode ] unit-test

"arbitrary triple byte" description
{ { 192 128 0 } }
[ { 1048576 } encode ] unit-test

"asymmetric triple byte" description
{ { 135 171 28 } }
[ { 120220 } encode ] unit-test

"largest triple byte" description
{ { 255 255 127 } }
[ { 2097151 } encode ] unit-test

"smallest quadruple byte" description
{ { 129 128 128 0 } }
[ { 2097152 } encode ] unit-test

"arbitrary quadruple byte" description
{ { 192 128 128 0 } }
[ { 134217728 } encode ] unit-test

"asymmetric quadruple byte" description
{ { 129 213 238 4 } }
[ { 3503876 } encode ] unit-test

"largest quadruple byte" description
{ { 255 255 255 127 } }
[ { 268435455 } encode ] unit-test

"smallest quintuple byte" description
{ { 129 128 128 128 0 } }
[ { 268435456 } encode ] unit-test

"arbitrary quintuple byte" description
{ { 143 248 128 128 0 } }
[ { 4278190080 } encode ] unit-test

"asymmetric quintuple byte" description
{ { 136 179 149 194 5 } }
[ { 2254790917 } encode ] unit-test

"maximum 32-bit integer input" description
{ { 143 255 255 255 127 } }
[ { 4294967295 } encode ] unit-test

"two single-byte values" description
{ { 64 127 } }
[ { 64 127 } encode ] unit-test

"two multi-byte values" description
{ { 129 128 0 200 232 86 } }
[ { 16384 1193046 } encode ] unit-test

"many multi-byte values" description
{ { 192 0 200 232 86 255 255 255 127 0 255 127 129 128 0 } }
[ { 8192 1193046 268435455 0 16383 16384 } encode ] unit-test

"one byte" description
{ { 127 } }
[ { 127 } decode ] unit-test

"two bytes" description
{ { 8192 } }
[ { 192 0 } decode ] unit-test

"three bytes" description
{ { 2097151 } }
[ { 255 255 127 } decode ] unit-test

"four bytes" description
{ { 2097152 } }
[ { 129 128 128 0 } decode ] unit-test

"maximum 32-bit integer" description
{ { 4294967295 } }
[ { 143 255 255 255 127 } decode ] unit-test

"incomplete sequence causes error" description
[ { 255 } decode ] [ "incomplete sequence" = ] must-fail-with

"incomplete sequence causes error, even if value is zero" description
[ { 128 } decode ] [ "incomplete sequence" = ] must-fail-with

"multiple values" description
{ { 8192 1193046 268435455 0 16383 16384 } }
[ { 192 0 200 232 86 255 255 255 127 0 255 127 129 128 0 } decode ] unit-test
