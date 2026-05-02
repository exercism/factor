# Instructions

You're the wireless telegrapher on a freighter. The signal comes
in over a noisy line — ship's machinery, weather static, the
occasional foreign chatter — interleaved with the actual Morse
you're listening for. To catch the message you feed the wire
through a *tape* device that strips out everything except valid
Morse symbols (`.`, `-`, and the space that separates letters).

Your job is to build the tape as a custom Factor input stream.

## 1. Define the tape

Define a `tape` tuple that extends `disposable` and holds one
slot, `wire`, for the underlying input stream.

```factor
TUPLE: tape < disposable wire ;
```

Then write the constructor `<tape> ( wire -- tape )`. Use
`new-disposable` (not `new`) so the destructor framework
registers the tape, and store the underlying stream in the
`wire` slot.

## 2. Join the input-stream mixin

Declare `tape` to be an `input-stream`:

```factor
INSTANCE: tape input-stream
```

That makes the protocol's default combinators dispatch to your
class.

## 3. Read one Morse symbol

Implement `M: tape stream-read1 ( tape -- elt/f )`. Read bytes
from the underlying wire until you hit one of `CHAR: .`,
`CHAR: -`, or `CHAR: \s` (space). Return that byte. If the wire
returns `f` (end-of-stream), return `f` too — the tape is done.

```factor
"x.y -ab cz" <string-reader> <tape>
[ stream-read1 ] [ stream-read1 ] [ stream-read1 ] tri
! => CHAR: . CHAR: - CHAR: \s
```

## 4. Delegate the element type

Implement `M: tape stream-element-type ( tape -- type )` by
delegating to the wire — the tape doesn't change the kind of
elements being read.

## 5. Clean up

Implement `M: tape dispose* ( tape -- )`. The framework calls
your method exactly once per `dispose`; just dispose the
underlying wire.

With those five pieces in place the tape works as a regular
input stream — `with-input-stream`, `stream-read`, and the
other protocol words all dispatch to your methods automatically.
