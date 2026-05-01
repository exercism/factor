USING: accessors arrays destructors exercism-tools io
       io.streams.string kernel make math paasio sequences
       strings tools.test ;
IN: paasio.tests

"Paasio:" print

"Read all bytes in one stream-read call" print
{ { "hello" 5 1 } }
[ "hello" <string-reader> <metered-input>
  [ 100 swap stream-read ] keep
  [ bytes>> ] [ ops>> ] bi 3array ]
unit-test

STOP-HERE

"Five stream-read1 calls accumulate bytes and ops" print
{ { "hello" 5 5 } }
[ "hello" <string-reader> <metered-input>
  [ [ 5 [ dup stream-read1 , ] times drop ] { } make >string ]
  keep
  [ bytes>> ] [ ops>> ] bi 3array ]
unit-test

"Reading past EOF counts ops but not bytes" print
{ { 5 2 } }
[ "hello" <string-reader> <metered-input>
  [ 100 swap stream-read drop ] keep
  [ 100 swap stream-read drop ] keep
  [ bytes>> ] [ ops>> ] bi 2array ]
unit-test

"Write all bytes in one stream-write call" print
{ { "world" 5 1 } }
[ <string-writer> <metered-output>
  [ "world" swap stream-write ] keep
  [ stream>> >string ] [ bytes>> ] [ ops>> ] tri 3array ]
unit-test

"Four stream-write1 calls accumulate bytes and ops" print
{ { "abcd" 4 4 } }
[ <string-writer> <metered-output>
  [ CHAR: a over stream-write1
    CHAR: b over stream-write1
    CHAR: c over stream-write1
    CHAR: d over stream-write1
    drop ] keep
  [ stream>> >string ] [ bytes>> ] [ ops>> ] tri 3array ]
unit-test

"dispose marks the wrapper as disposed" print
{ t }
[ [ "ok" <string-reader> <metered-input>
    dup dispose disposed>> ] with-destructors ]
unit-test
