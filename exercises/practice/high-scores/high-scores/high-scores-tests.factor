USING: exercism-tools high-scores io kernel tools.test unicode ;
IN: high-scores.tests

"List of scores" description
{ { 30 50 20 70 } }
[ { 30 50 20 70 } <high-scores> scores ] unit-test

STOP-HERE

"Latest score" description
{ 30 }
[ { 100 0 90 30 } <high-scores> latest ] unit-test

"Personal best" description
{ 100 }
[ { 40 100 70 } <high-scores> personal-best ] unit-test

"Personal top three from a list of scores" description
{ { 100 90 70 } }
[ { 10 30 90 30 100 20 10 0 30 40 40 70 70 } <high-scores> personal-top-three ] unit-test

"Personal top highest to lowest" description
{ { 30 20 10 } }
[ { 20 10 30 } <high-scores> personal-top-three ] unit-test

"Personal top when there is a tie" description
{ { 40 40 30 } }
[ { 40 20 40 30 } <high-scores> personal-top-three ] unit-test

"Personal top when there are less than 3" description
{ { 70 30 } }
[ { 30 70 } <high-scores> personal-top-three ] unit-test

"Personal top when there is only one" description
{ { 40 } }
[ { 40 } <high-scores> personal-top-three ] unit-test

"Latest score after personal top scores" description
{ 30 }
[ { 70 50 20 30 } <high-scores> dup personal-top-three drop latest ] unit-test

"Scores after personal top scores" description
{ { 30 50 20 70 } }
[ { 30 50 20 70 } <high-scores> dup personal-top-three drop scores ] unit-test

"Latest score after personal best" description
{ 30 }
[ { 20 70 15 25 30 } <high-scores> dup personal-best drop latest ] unit-test

"Scores after personal best" description
{ { 20 70 15 25 30 } }
[ { 20 70 15 25 30 } <high-scores> dup personal-best drop scores ] unit-test
