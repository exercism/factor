USING: anagram exercism-tools io kernel tools.test unicode ;
IN: anagram.tests

"no matches" description
{ V{  } }
[ "diaper" V{ "hello" "world" "zombies" "pants" } find-anagrams ] unit-test

STOP-HERE

"detects two anagrams" description
{ V{ "lemons" "melons" } }
[ "solemn" V{ "lemons" "cherry" "melons" } find-anagrams ] unit-test

"does not detect anagram subsets" description
{ V{  } }
[ "good" V{ "dog" "goody" } find-anagrams ] unit-test

"detects anagram" description
{ V{ "inlets" } }
[ "listen" V{ "enlists" "google" "inlets" "banana" } find-anagrams ] unit-test

"detects three anagrams" description
{ V{ "gallery" "regally" "largely" } }
[ "allergy" V{ "gallery" "ballerina" "regally" "clergy" "largely" "leading" } find-anagrams ] unit-test

"detects multiple anagrams with different case" description
{ V{ "Eons" "ONES" } }
[ "nose" V{ "Eons" "ONES" } find-anagrams ] unit-test

"does not detect non-anagrams with identical checksum" description
{ V{  } }
[ "mass" V{ "last" } find-anagrams ] unit-test

"detects anagrams case-insensitively" description
{ V{ "Carthorse" } }
[ "Orchestra" V{ "cashregister" "Carthorse" "radishes" } find-anagrams ] unit-test

"detects anagrams using case-insensitive subject" description
{ V{ "carthorse" } }
[ "Orchestra" V{ "cashregister" "carthorse" "radishes" } find-anagrams ] unit-test

"detects anagrams using case-insensitive possible matches" description
{ V{ "Carthorse" } }
[ "orchestra" V{ "cashregister" "Carthorse" "radishes" } find-anagrams ] unit-test

"does not detect an anagram if the original word is repeated" description
{ V{  } }
[ "go" V{ "goGoGO" } find-anagrams ] unit-test

"anagrams must use all letters exactly once" description
{ V{  } }
[ "tapper" V{ "patter" } find-anagrams ] unit-test

"words are not anagrams of themselves even if letter case is completely different" description
{ V{  } }
[ "BANANA" V{ "banana" } find-anagrams ] unit-test

"words other than themselves can be anagrams" description
{ V{ "Silent" } }
[ "LISTEN" V{ "LISTEN" "Silent" } find-anagrams ] unit-test

"handles case of greek letters" description
{ V{ "ΒΓΑ" "γβα" } }
[ "ΑΒΓ" V{ "ΒΓΑ" "ΒΓΔ" "γβα" "αβγ" } find-anagrams ] unit-test

"different characters may have the same bytes" description
{ V{  } }
[ "a⬂" V{ "€a" } find-anagrams ] unit-test
