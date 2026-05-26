USING: exercism-tools io kernel tools.test unicode word-count ;
IN: word-count.tests

"count one word" description
{ H{ { "word" 1 } } }
[ "word" count-words ] unit-test

STOP-HERE

"count one of each word" description
{ H{ { "each" 1 } { "of" 1 } { "one" 1 } } }
[ "one of each" count-words ] unit-test

"multiple occurrences of a word" description
{ H{ { "blue" 1 } { "fish" 4 } { "one" 1 } { "red" 1 } { "two" 1 } } }
[ "one fish two fish red fish blue fish" count-words ] unit-test

"handles cramped lists" description
{ H{ { "one" 1 } { "three" 1 } { "two" 1 } } }
[ "one,two,three" count-words ] unit-test

"handles expanded lists" description
{ H{ { "one" 1 } { "three" 1 } { "two" 1 } } }
[ "one,\ntwo,\nthree" count-words ] unit-test

"ignore punctuation" description
{ H{ { "as" 1 } { "car" 1 } { "carpet" 1 } { "java" 1 } { "javascript" 1 } } }
[ "car: carpet as java: javascript!!&@$%^&" count-words ] unit-test

"include numbers" description
{ H{ { "1" 1 } { "2" 1 } { "testing" 2 } } }
[ "testing, 1, 2 testing" count-words ] unit-test

"normalize case" description
{ H{ { "go" 3 } { "stop" 2 } } }
[ "go Go GO Stop stop" count-words ] unit-test

"with apostrophes" description
{ H{ { "cry" 1 } { "don't" 2 } { "first" 1 } { "getting" 1 } { "it" 1 } { "laugh" 1 } { "then" 1 } { "you're" 1 } } }
[ "'First: don't laugh. Then: don't cry. You're getting it.'" count-words ] unit-test

"with quotations" description
{ H{ { "and" 1 } { "between" 1 } { "can't" 1 } { "joe" 1 } { "large" 2 } { "tell" 1 } } }
[ "Joe can't tell between 'large' and large." count-words ] unit-test

"substrings from the beginning" description
{ H{ { "a" 1 } { "and" 1 } { "app" 1 } { "apple" 1 } { "between" 1 } { "can't" 1 } { "joe" 1 } { "tell" 1 } } }
[ "Joe can't tell between app, apple and a." count-words ] unit-test

"multiple spaces not detected as a word" description
{ H{ { "multiple" 1 } { "whitespaces" 1 } } }
[ " multiple   whitespaces" count-words ] unit-test

"alternating word separators not detected as a word" description
{ H{ { "one" 1 } { "three" 1 } { "two" 1 } } }
[ ",\n,one,\n ,two \n 'three'" count-words ] unit-test

"quotation for word with apostrophe" description
{ H{ { "can" 1 } { "can't" 2 } } }
[ "can, can't, 'can't'" count-words ] unit-test
