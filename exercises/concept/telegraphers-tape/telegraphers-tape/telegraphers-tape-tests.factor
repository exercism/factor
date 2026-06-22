USING: accessors destructors exercism-tools io
       io.streams.string kernel telegraphers-tape tools.test ;
IN: telegraphers-tape.tests

TASK: 1 <tape>
! the constructor stores the wire — read straight from it
{ CHAR: a } [ "abc" <string-reader> <tape> wire>> stream-read1 ] unit-test

STOP-HERE

TASK: 2 input-stream instance
{ t } [ "x" <string-reader> <tape> input-stream? ] unit-test

TASK: 3 stream-read1
! reading a Morse symbol from a clean wire
{ CHAR: . } [ "." <string-reader> <tape> stream-read1 ] unit-test
! skipping noise before a dash
{ CHAR: - } [ "xy-" <string-reader> <tape> stream-read1 ] unit-test
! end of wire returns f
{ f } [ "" <string-reader> <tape> stream-read1 ] unit-test
! only noise remains returns f
{ f } [ "xyz" <string-reader> <tape> stream-read1 ] unit-test
! dot, dash, space in sequence
{ CHAR: . CHAR: - CHAR: \s } [
    "x.y-ab cz" <string-reader> <tape>
    [ stream-read1 ] [ stream-read1 ] [ stream-read1 ] tri
] unit-test

TASK: 4 stream-element-type
! the element type delegates to the wire
{ +character+ } [ "" <string-reader> <tape> stream-element-type ] unit-test

TASK: 5 dispose
! dispose marks the tape as disposed
{ t } [
    [ "ab" <string-reader> <tape> dup dispose disposed>> ] with-destructors
] unit-test
! with-input-stream disposes automatically
{ t } [
    "" <string-reader> <tape> dup [ ] with-input-stream disposed>>
] unit-test
