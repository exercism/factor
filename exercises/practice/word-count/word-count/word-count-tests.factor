USING: exercism-tools io kernel tools.test unicode word-count ;
IN: word-count.tests

"Word Count:" print

"count one word" print
{ H{ { "word" 1 } } }
[ "word" count-words ] unit-test

STOP-HERE

"count one of each word" print
{ H{ { "each" 1 } { "of" 1 } { "one" 1 } } }
[ "one of each" count-words ] unit-test

"multiple occurrences of a word" print
{ H{ { "blue" 1 } { "fish" 4 } { "one" 1 } { "red" 1 } { "two" 1 } } }
[ "one fish two fish red fish blue fish" count-words ] unit-test

"handles cramped lists" print
{ H{ { "one" 1 } { "three" 1 } { "two" 1 } } }
[ "one,two,three" count-words ] unit-test

"handles expanded lists" print
{ H{ { "one" 1 } { "three" 1 } { "two" 1 } } }
[ "one,\ntwo,\nthree" count-words ] unit-test

"ignore punctuation" print
{ H{ { "as" 1 } { "car" 1 } { "carpet" 1 } { "java" 1 } { "javascript" 1 } } }
[ "car: carpet as java: javascript!!&@$%^&" count-words ] unit-test

"include numbers" print
{ H{ { "1" 1 } { "2" 1 } { "testing" 2 } } }
[ "testing, 1, 2 testing" count-words ] unit-test

"normalize case" print
{ H{ { "go" 3 } { "stop" 2 } } }
[ "go Go GO Stop stop" count-words ] unit-test

"with apostrophes" print
{ H{ { "cry" 1 } { "don't" 2 } { "first" 1 } { "getting" 1 } { "it" 1 } { "laugh" 1 } { "then" 1 } { "you're" 1 } } }
[ "'First: don't laugh. Then: don't cry. You're getting it.'" count-words ] unit-test

"with quotations" print
{ H{ { "and" 1 } { "between" 1 } { "can't" 1 } { "joe" 1 } { "large" 2 } { "tell" 1 } } }
[ "Joe can't tell between 'large' and large." count-words ] unit-test

"substrings from the beginning" print
{ H{ { "a" 1 } { "and" 1 } { "app" 1 } { "apple" 1 } { "between" 1 } { "can't" 1 } { "joe" 1 } { "tell" 1 } } }
[ "Joe can't tell between app, apple and a." count-words ] unit-test

"multiple spaces not detected as a word" print
{ H{ { "multiple" 1 } { "whitespaces" 1 } } }
[ " multiple   whitespaces" count-words ] unit-test

"alternating word separators not detected as a word" print
{ H{ { "one" 1 } { "three" 1 } { "two" 1 } } }
[ ",\n,one,\n ,two \n 'three'" count-words ] unit-test

"quotation for word with apostrophe" print
{ H{ { "can" 1 } { "can't" 2 } } }
[ "can, can't, 'can't'" count-words ] unit-test
