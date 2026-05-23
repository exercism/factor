USING: channel-chatter exercism-tools io io.streams.string kernel
       namespaces tools.test ;
IN: channel-chatter.tests

TASK: 1 hear-out
{ "all quiet on the channel" }
[ "all quiet on the channel" <string-reader> hear-out ] unit-test

STOP-HERE

{ "" } [ "" <string-reader> hear-out ] unit-test

TASK: 2 count-messages
{ 3 } [ "alpha\nbravo\ncharlie\n" <string-reader> count-messages ] unit-test
{ 0 } [ "" <string-reader> count-messages ] unit-test
{ 1 } [ "solo" <string-reader> count-messages ] unit-test

TASK: 3 echo-back
{ "BRAVO" } [ "alpha\nbravo\n" <string-reader> echo-back ] unit-test
{ "ROGER" } [ "roger" <string-reader> echo-back ] unit-test

TASK: 4 broadcast
{ "mayday" } [
    [ "mayday" output-stream get broadcast ] with-string-writer
] unit-test

{ "alpha-bravo" } [
    [
        "alpha-" output-stream get broadcast
        "bravo"  output-stream get broadcast
    ] with-string-writer
] unit-test

TASK: 5 capture
{ "test broadcast\n" } [ [ "test broadcast" print ] capture ] unit-test
{ "" } [ [ ] capture ] unit-test

! capture redirects ambient print — caller's print sees the captured stream
{ "abc" } [ [ "a" write "b" write "c" write ] capture ] unit-test
