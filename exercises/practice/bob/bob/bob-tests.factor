USING: bob exercism-tools io kernel tools.test unicode ;
IN: bob.tests

"stating something" description
{ "Whatever." }
[ "Tom-ay-to, tom-aaaah-to." response ] unit-test

STOP-HERE

"shouting" description
{ "Whoa, chill out!" }
[ "WATCH OUT!" response ] unit-test

"shouting gibberish" description
{ "Whoa, chill out!" }
[ "FCECDFCAAB" response ] unit-test

"asking a question" description
{ "Sure." }
[ "Does this cryogenic chamber make me look fat?" response ] unit-test

"asking a numeric question" description
{ "Sure." }
[ "You are, what, like 15?" response ] unit-test

"asking gibberish" description
{ "Sure." }
[ "fffbbcbeab?" response ] unit-test

"talking forcefully" description
{ "Whatever." }
[ "Hi there!" response ] unit-test

"using acronyms in regular speech" description
{ "Whatever." }
[ "It's OK if you don't want to go work for NASA." response ] unit-test

"forceful question" description
{ "Calm down, I know what I'm doing!" }
[ "WHAT'S GOING ON?" response ] unit-test

"shouting numbers" description
{ "Whoa, chill out!" }
[ "1, 2, 3 GO!" response ] unit-test

"no letters" description
{ "Whatever." }
[ "1, 2, 3" response ] unit-test

"question with no letters" description
{ "Sure." }
[ "4?" response ] unit-test

"shouting with special characters" description
{ "Whoa, chill out!" }
[ "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!" response ] unit-test

"shouting with no exclamation mark" description
{ "Whoa, chill out!" }
[ "I HATE THE DENTIST" response ] unit-test

"statement containing question mark" description
{ "Whatever." }
[ "Ending with ? means a question." response ] unit-test

"non-letters with question" description
{ "Sure." }
[ ":) ?" response ] unit-test

"prattling on" description
{ "Sure." }
[ "Wait! Hang on. Are you going to be OK?" response ] unit-test

"silence" description
{ "Fine. Be that way!" }
[ "" response ] unit-test

"prolonged silence" description
{ "Fine. Be that way!" }
[ "          " response ] unit-test

"alternate silence" description
{ "Fine. Be that way!" }
[ "\t\t\t\t\t\t\t\t\t\t" response ] unit-test

"multiple line question" description
{ "Sure." }
[ "\nDoes this cryogenic chamber make\n me look fat?" response ] unit-test

"starting with whitespace" description
{ "Whatever." }
[ "         hmmmmmmm..." response ] unit-test

"ending with whitespace" description
{ "Sure." }
[ "Okay if like my  spacebar  quite a bit?   " response ] unit-test

"other whitespace" description
{ "Fine. Be that way!" }
[ "\n\r \t" response ] unit-test

"non-question ending with whitespace" description
{ "Whatever." }
[ "This is a statement ending with whitespace      " response ] unit-test
