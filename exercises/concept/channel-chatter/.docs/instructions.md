# Instructions

You're at the coastal radio shack, monitoring channel chatter:
messages arrive on the wire, you log them, and you push replies
back out. Five small words handle one shift's worth of work.

The tests pass you `<string-reader>` inputs (incoming traffic)
and use `<string-writer>` for outgoing — but every word here
works the same way against a real `<file-reader>` or socket.

## 1. Hear it all out

Define `hear-out` to drain an input stream into a single string.

```factor
"all quiet on the channel" <string-reader> hear-out .
! => "all quiet on the channel"
```

## 2. Count the messages

Define `count-messages` to read every line from an input stream
and return how many there were.

```factor
"alpha\nbravo\ncharlie\n" <string-reader> count-messages .
! => 3
```

## 3. Echo back the last call

Define `echo-back` to read every line and return the **last
one in upper case** — the standard radio "you said X" reply.

```factor
"alpha\nbravo\n" <string-reader> echo-back .
! => "BRAVO"
```

## 4. Broadcast a message

Define `broadcast` to write a message to a given writer and
flush the stream so it goes out immediately. Returns nothing.

```factor
[ "mayday" output-stream get broadcast ] with-string-writer .
! => "mayday"
```

## 5. Capture a quotation's output

Define `capture` to run a quotation with a fresh string-writer
as the ambient output, and return whatever the quotation
printed. The quotation doesn't take any arguments — it just
writes to the ambient stream as usual.

```factor
[ "test broadcast" print ] capture .
! => "test broadcast\n"
```
