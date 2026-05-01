USING: exercism-tools kernel lap-leaderboard tools.test ;
IN: lap-leaderboard.tests

TASK: 1 assign-bibs
{ { { 0 "Bolt" } { 1 "Comet" } { 2 "Spirit" } } }
[ { "Bolt" "Comet" "Spirit" } assign-bibs ] unit-test

STOP-HERE

{ { } } [ { } assign-bibs ] unit-test

{ { { 0 "solo" } } } [ { "solo" } assign-bibs ] unit-test

TASK: 2 lane-labels
{ { "Lane 0: Bolt" "Lane 1: Comet" } }
[ { "Bolt" "Comet" } lane-labels ] unit-test

{ { } } [ { } lane-labels ] unit-test

{ { "Lane 0: solo" } } [ { "solo" } lane-labels ] unit-test

TASK: 3 tag-racers
{ { "Green/0: Bolt" "Green/1: Comet" } }
[ { "Bolt" "Comet" } "Green" tag-racers ] unit-test

{ { } } [ { } "Green" tag-racers ] unit-test

{ { "Red/0: Spirit" "Red/1: Bolt" "Red/2: Comet" } }
[ { "Spirit" "Bolt" "Comet" } "Red" tag-racers ] unit-test

TASK: 4 record-finishes
{ V{ "0: Bolt" "1: Comet" } }
[ V{ } clone { "Bolt" "Comet" } over record-finishes ] unit-test

{ V{ } } [ V{ } clone { } over record-finishes ] unit-test

! pre-existing entries are preserved; new ones append after
{ V{ "DNF" "0: Bolt" "1: Comet" } }
[ V{ "DNF" } clone { "Bolt" "Comet" } over record-finishes ] unit-test

TASK: 5 lap-bells
{ "" } [ 0 lap-bells ] unit-test
{ "ding " } [ 1 lap-bells ] unit-test
{ "ding ding ding " } [ 3 lap-bells ] unit-test
