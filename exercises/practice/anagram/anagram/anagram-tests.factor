USING: anagram io kernel lexer tools.test unicode ;
IN: anagram.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Anagram:" print

"no matches" print
{ V{  } }
[ "diaper" V{ "hello" "world" "zombies" "pants" } find-anagrams ] unit-test

STOP-HERE

"detects two anagrams" print
{ V{ "lemons" "melons" } }
[ "solemn" V{ "lemons" "cherry" "melons" } find-anagrams ] unit-test

"does not detect anagram subsets" print
{ V{  } }
[ "good" V{ "dog" "goody" } find-anagrams ] unit-test

"detects anagram" print
{ V{ "inlets" } }
[ "listen" V{ "enlists" "google" "inlets" "banana" } find-anagrams ] unit-test

"detects three anagrams" print
{ V{ "gallery" "regally" "largely" } }
[ "allergy" V{ "gallery" "ballerina" "regally" "clergy" "largely" "leading" } find-anagrams ] unit-test

"detects multiple anagrams with different case" print
{ V{ "Eons" "ONES" } }
[ "nose" V{ "Eons" "ONES" } find-anagrams ] unit-test

"does not detect non-anagrams with identical checksum" print
{ V{  } }
[ "mass" V{ "last" } find-anagrams ] unit-test

"detects anagrams case-insensitively" print
{ V{ "Carthorse" } }
[ "Orchestra" V{ "cashregister" "Carthorse" "radishes" } find-anagrams ] unit-test

"detects anagrams using case-insensitive subject" print
{ V{ "carthorse" } }
[ "Orchestra" V{ "cashregister" "carthorse" "radishes" } find-anagrams ] unit-test

"detects anagrams using case-insensitive possible matches" print
{ V{ "Carthorse" } }
[ "orchestra" V{ "cashregister" "Carthorse" "radishes" } find-anagrams ] unit-test

"does not detect an anagram if the original word is repeated" print
{ V{  } }
[ "go" V{ "goGoGO" } find-anagrams ] unit-test

"anagrams must use all letters exactly once" print
{ V{  } }
[ "tapper" V{ "patter" } find-anagrams ] unit-test

"words are not anagrams of themselves even if letter case is completely different" print
{ V{  } }
[ "BANANA" V{ "banana" } find-anagrams ] unit-test

"words other than themselves can be anagrams" print
{ V{ "Silent" } }
[ "LISTEN" V{ "LISTEN" "Silent" } find-anagrams ] unit-test

"handles case of greek letters" print
{ V{ "ΒΓΑ" "γβα" } }
[ "ΑΒΓ" V{ "ΒΓΑ" "ΒΓΔ" "γβα" "αβγ" } find-anagrams ] unit-test

"different characters may have the same bytes" print
{ V{  } }
[ "a⬂" V{ "€a" } find-anagrams ] unit-test
