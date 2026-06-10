USING: exercism-tools io.encodings.utf8 io.files kernel
       vltava-weather-watch tools.test ;
IN: vltava-weather-watch.tests

TASK: 1 read-readings
"21.5\n19.0\n22.3\n" "weather.log" utf8 set-file-contents
{ { "21.5" "19.0" "22.3" } }
[ "weather.log" read-readings ] unit-test

STOP-HERE

"7.0\n" "weather.log" utf8 set-file-contents
{ { "7.0" } } [ "weather.log" read-readings ] unit-test

TASK: 2 latest-reading
"21.5\n19.0\n22.3\n" "weather.log" utf8 set-file-contents
{ "22.3" } [ "weather.log" latest-reading ] unit-test

"5.5\n" "weather.log" utf8 set-file-contents
{ "5.5" } [ "weather.log" latest-reading ] unit-test

TASK: 3 log-text
"21.5\n19.0\n" "weather.log" utf8 set-file-contents
{ "21.5\n19.0\n" } [ "weather.log" log-text ] unit-test

TASK: 4 record-reading
"21.5\n19.0\n" "weather.log" utf8 set-file-contents
{ "21.5\n19.0\n22.3\n" } [
    "22.3" "weather.log" record-reading
    "weather.log" utf8 file-contents
] unit-test

! appending to an empty log writes the first line
"" "weather.log" utf8 set-file-contents
{ "18.0\n" } [
    "18.0" "weather.log" record-reading
    "weather.log" utf8 file-contents
] unit-test

TASK: 5 rewrite-log
"99.9\n98.8\n" "weather.log" utf8 set-file-contents
{ "21.5\n19.0\n22.3\n" } [
    { "21.5" "19.0" "22.3" } "weather.log" rewrite-log
    "weather.log" utf8 file-contents
] unit-test
