USING: io kernel lexer rail-fence-cipher tools.test unicode ;
IN: rail-fence-cipher.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Rail Fence Cipher:" print

"encode with two rails" print
{ "XXXXXXXXXOOOOOOOOO" }
[ "XOXOXOXOXOXOXOXOXO" 2 encode ] unit-test

STOP-HERE

"encode with three rails" print
{ "WECRLTEERDSOEEFEAOCAIVDEN" }
[ "WEAREDISCOVEREDFLEEATONCE" 3 encode ] unit-test

"encode with ending in the middle" print
{ "ESXIEECSR" }
[ "EXERCISES" 4 encode ] unit-test

"decode with three rails" print
{ "THEDEVILISINTHEDETAILS" }
[ "TEITELHDVLSNHDTISEIIEA" 3 decode ] unit-test

"decode with five rails" print
{ "EXERCISMISAWESOME" }
[ "EIEXMSMESAORIWSCE" 5 decode ] unit-test

"decode with six rails" print
{ "112358132134558914423337761098715972584418167651094617711286" }
[ "133714114238148966225439541018335470986172518171757571896261" 6 decode ] unit-test

"decode with seven rails" print
{ "ANANCIENTADAGEWARNSNEVERGOTOSEAWITHTWOCHRONOMETERSTAKEONEORTHREE" }
[ "AGGWRHNAEROTOESTRADWETHCTTRENAAVOTHEAOECTRESIRMKEINNNEWOOENESANO" 7 decode ] unit-test
