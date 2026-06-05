USING: exercism-tools io kernel tools.test two-bucket unicode ;
IN: two-bucket.tests

"Measure using bucket one of size 3 and bucket two of size 5 - start with bucket one" description
{ 4 "one" 5 }
[ 3 5 1 "one" measure ] unit-test

STOP-HERE

"Measure using bucket one of size 3 and bucket two of size 5 - start with bucket two" description
{ 8 "two" 3 }
[ 3 5 1 "two" measure ] unit-test

"Measure using bucket one of size 7 and bucket two of size 11 - start with bucket one" description
{ 14 "one" 11 }
[ 7 11 2 "one" measure ] unit-test

"Measure using bucket one of size 7 and bucket two of size 11 - start with bucket two" description
{ 18 "two" 7 }
[ 7 11 2 "two" measure ] unit-test

"Measure one step using bucket one of size 1 and bucket two of size 3 - start with bucket two" description
{ 1 "two" 0 }
[ 1 3 3 "two" measure ] unit-test

"Measure using bucket one of size 2 and bucket two of size 3 - start with bucket one and end with bucket two" description
{ 2 "two" 2 }
[ 2 3 3 "one" measure ] unit-test

"Measure using bucket one much bigger than bucket two" description
{ 6 "one" 1 }
[ 5 1 2 "one" measure ] unit-test

"Measure using bucket one much smaller than bucket two" description
{ 6 "two" 0 }
[ 3 15 9 "one" measure ] unit-test

"Not possible to reach the goal" description
[ 6 15 5 "one" measure ] [ goal-not-reachable? ] must-fail-with

"With the same buckets but a different goal, then it is possible" description
{ 10 "two" 0 }
[ 6 15 9 "one" measure ] unit-test

"Goal larger than both buckets is impossible" description
[ 5 7 8 "one" measure ] [ goal-not-reachable? ] must-fail-with
