USING: arrays circular-buffer exercism-tools io kernel locals sequences tools.test unicode ;
IN: circular-buffer.tests
FROM: circular-buffer => read write ;

"reading empty buffer should fail" description
[
    [let 1 <circular-buffer> :> buf
      V{ } clone :> log
      buf read drop
    ]
] must-fail

STOP-HERE

"can read an item just written" description
{ { 1 } } [
    [let 1 <circular-buffer> :> buf
      V{ } clone :> log
      1 buf write
      buf read log push
      log >array
    ]
] unit-test

"each item may only be read once" description
[
    [let 1 <circular-buffer> :> buf
      V{ } clone :> log
      1 buf write
      buf read log push
      buf read drop
    ]
] must-fail

"items are read in the order they are written" description
{ { 1 2 } } [
    [let 2 <circular-buffer> :> buf
      V{ } clone :> log
      1 buf write
      2 buf write
      buf read log push
      buf read log push
      log >array
    ]
] unit-test

"full buffer can't be written to" description
[
    [let 1 <circular-buffer> :> buf
      V{ } clone :> log
      1 buf write
      2 buf write
    ]
] must-fail

"a read frees up capacity for another write" description
{ { 1 2 } } [
    [let 1 <circular-buffer> :> buf
      V{ } clone :> log
      1 buf write
      buf read log push
      2 buf write
      buf read log push
      log >array
    ]
] unit-test

"read position is maintained even across multiple writes" description
{ { 1 2 3 } } [
    [let 3 <circular-buffer> :> buf
      V{ } clone :> log
      1 buf write
      2 buf write
      buf read log push
      3 buf write
      buf read log push
      buf read log push
      log >array
    ]
] unit-test

"items cleared out of buffer can't be read" description
[
    [let 1 <circular-buffer> :> buf
      V{ } clone :> log
      1 buf write
      buf clear-buffer
      buf read drop
    ]
] must-fail

"clear frees up capacity for another write" description
{ { 2 } } [
    [let 1 <circular-buffer> :> buf
      V{ } clone :> log
      1 buf write
      buf clear-buffer
      2 buf write
      buf read log push
      log >array
    ]
] unit-test

"clear does nothing on empty buffer" description
{ { 1 } } [
    [let 1 <circular-buffer> :> buf
      V{ } clone :> log
      buf clear-buffer
      1 buf write
      buf read log push
      log >array
    ]
] unit-test

"overwrite acts like write on non-full buffer" description
{ { 1 2 } } [
    [let 2 <circular-buffer> :> buf
      V{ } clone :> log
      1 buf write
      2 buf overwrite
      buf read log push
      buf read log push
      log >array
    ]
] unit-test

"overwrite replaces the oldest item on full buffer" description
{ { 2 3 } } [
    [let 2 <circular-buffer> :> buf
      V{ } clone :> log
      1 buf write
      2 buf write
      3 buf overwrite
      buf read log push
      buf read log push
      log >array
    ]
] unit-test

"overwrite replaces the oldest item remaining in buffer following a read" description
{ { 1 3 4 5 } } [
    [let 3 <circular-buffer> :> buf
      V{ } clone :> log
      1 buf write
      2 buf write
      3 buf write
      buf read log push
      4 buf write
      5 buf overwrite
      buf read log push
      buf read log push
      buf read log push
      log >array
    ]
] unit-test

"initial clear does not affect wrapping around" description
[
    [let 2 <circular-buffer> :> buf
      V{ } clone :> log
      buf clear-buffer
      1 buf write
      2 buf write
      3 buf overwrite
      4 buf overwrite
      buf read log push
      buf read log push
      buf read drop
    ]
] must-fail
