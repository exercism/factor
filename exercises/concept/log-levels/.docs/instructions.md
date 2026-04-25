# Instructions

In this exercise you'll be processing log lines.

Each log line is a string formatted as `"[<LEVEL>]: <MESSAGE>"`.

There are three log levels: `INFO`, `WARNING`, and `ERROR`.

You have three tasks. Each takes a single log line off the stack.

## 1. Get message from a log line

Define `message` to return the log line's message. Any leading or
trailing whitespace should be removed.

```factor
"[ERROR]: Invalid operation" message .
! => "Invalid operation"

"[WARNING]:  Disk almost full\r\n" message .
! => "Disk almost full"
```

## 2. Get log level from a log line

Define `log-level` to return the log line's level, lowercased.

```factor
"[ERROR]: Invalid operation" log-level .
! => "error"
```

## 3. Reformat a log line

Define `reformat` to put the message first and the lowercase log level
in parentheses after it.

```factor
"[INFO]: Operation completed" reformat .
! => "Operation completed (info)"
```

----

***Note:*** All strings in this exercise are ASCII. Later exercises
will tackle Unicode-aware string handling.
