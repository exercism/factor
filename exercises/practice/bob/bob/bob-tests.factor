USING: bob exercism-tools io kernel tools.test unicode ;
IN: bob.tests

"Bob:" print

"stating something" print
{ "Whatever." }
[ "Tom-ay-to, tom-aaaah-to." response ] unit-test

STOP-HERE

"shouting" print
{ "Whoa, chill out!" }
[ "WATCH OUT!" response ] unit-test

"shouting gibberish" print
{ "Whoa, chill out!" }
[ "FCECDFCAAB" response ] unit-test

"asking a question" print
{ "Sure." }
[ "Does this cryogenic chamber make me look fat?" response ] unit-test

"asking a numeric question" print
{ "Sure." }
[ "You are, what, like 15?" response ] unit-test

"asking gibberish" print
{ "Sure." }
[ "fffbbcbeab?" response ] unit-test

"talking forcefully" print
{ "Whatever." }
[ "Hi there!" response ] unit-test

"using acronyms in regular speech" print
{ "Whatever." }
[ "It's OK if you don't want to go work for NASA." response ] unit-test

"forceful question" print
{ "Calm down, I know what I'm doing!" }
[ "WHAT'S GOING ON?" response ] unit-test

"shouting numbers" print
{ "Whoa, chill out!" }
[ "1, 2, 3 GO!" response ] unit-test

"no letters" print
{ "Whatever." }
[ "1, 2, 3" response ] unit-test

"question with no letters" print
{ "Sure." }
[ "4?" response ] unit-test

"shouting with special characters" print
{ "Whoa, chill out!" }
[ "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!" response ] unit-test

"shouting with no exclamation mark" print
{ "Whoa, chill out!" }
[ "I HATE THE DENTIST" response ] unit-test

"statement containing question mark" print
{ "Whatever." }
[ "Ending with ? means a question." response ] unit-test

"non-letters with question" print
{ "Sure." }
[ ":) ?" response ] unit-test

"prattling on" print
{ "Sure." }
[ "Wait! Hang on. Are you going to be OK?" response ] unit-test

"silence" print
{ "Fine. Be that way!" }
[ "" response ] unit-test

"prolonged silence" print
{ "Fine. Be that way!" }
[ "          " response ] unit-test

"alternate silence" print
{ "Fine. Be that way!" }
[ "\t\t\t\t\t\t\t\t\t\t" response ] unit-test

"multiple line question" print
{ "Sure." }
[ "\nDoes this cryogenic chamber make\n me look fat?" response ] unit-test

"starting with whitespace" print
{ "Whatever." }
[ "         hmmmmmmm..." response ] unit-test

"ending with whitespace" print
{ "Sure." }
[ "Okay if like my  spacebar  quite a bit?   " response ] unit-test

"other whitespace" print
{ "Fine. Be that way!" }
[ "\n\r \t" response ] unit-test

"non-question ending with whitespace" print
{ "Whatever." }
[ "This is a statement ending with whitespace      " response ] unit-test
