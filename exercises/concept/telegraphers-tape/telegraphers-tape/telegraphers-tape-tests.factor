USING: accessors destructors exercism-tools io
       io.streams.string kernel telegraphers-tape tools.test ;
IN: telegraphers-tape.tests

"Telegraphers Tape:" print

"Reading a Morse symbol from a clean wire" print
{ CHAR: . }
[ "." <string-reader> <tape> stream-read1 ]
unit-test

STOP-HERE

"Skipping noise before a dash" print
{ CHAR: - }
[ "xy-" <string-reader> <tape> stream-read1 ]
unit-test

"Returning f at end of wire" print
{ f }
[ "" <string-reader> <tape> stream-read1 ]
unit-test

"Returning f when only noise remains" print
{ f }
[ "xyz" <string-reader> <tape> stream-read1 ]
unit-test

"Reading dot, dash, space in sequence" print
{ CHAR: . CHAR: - CHAR: \s }
[ "x.y-ab cz" <string-reader> <tape>
  [ stream-read1 ] [ stream-read1 ] [ stream-read1 ] tri ]
unit-test

"stream-element-type delegates to the wire" print
{ +character+ }
[ "" <string-reader> <tape> stream-element-type ]
unit-test

"dispose marks the tape as disposed" print
{ t }
[ [ "ab" <string-reader> <tape>
    dup dispose disposed>> ] with-destructors ]
unit-test

"with-input-stream disposes automatically" print
{ t }
[ "" <string-reader> <tape>
  dup [ ] with-input-stream
  disposed>> ]
unit-test
