USING: exercism-tools gigasecond io kernel tools.test unicode ;
IN: gigasecond.tests

"date only specification of time" description
{ "2043-01-01T01:46:40" }
[ "2011-04-25" gigasecond-after ] unit-test

STOP-HERE

"second test for date only specification of time" description
{ "2009-02-19T01:46:40" }
[ "1977-06-13" gigasecond-after ] unit-test

"third test for date only specification of time" description
{ "1991-03-27T01:46:40" }
[ "1959-07-19" gigasecond-after ] unit-test

"full time specified" description
{ "2046-10-02T23:46:40" }
[ "2015-01-24T22:00:00" gigasecond-after ] unit-test

"full time with day roll-over" description
{ "2046-10-03T01:46:39" }
[ "2015-01-24T23:59:59" gigasecond-after ] unit-test
