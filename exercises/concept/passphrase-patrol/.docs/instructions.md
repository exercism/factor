# Instructions

You run the security desk at a research station. Staff carry *badges*
whose codes follow a strict format, the access log is full of those
codes mixed into ordinary text, and the log has to be cleaned up
before it can be shared. Regular expressions are the right tool for
all four jobs.

A valid badge code is **two capital letters, a dash, then four
digits** — for example `NS-1024`.

## 1. Check a badge code

Define `valid-badge?`, taking a badge string and returning `t` when
the *whole* string is a valid badge code and `f` otherwise.

```factor
"NS-1024" valid-badge? .   ! => t
"NS-10"   valid-badge? .   ! => f
```

## 2. Pull every code out of a log line

Define `badge-codes`, taking a line of the access log and returning a
sequence of all the badge codes that appear in it, in order.

```factor
"seen NS-1024 then AB-0007 today" badge-codes .
! => { "NS-1024" "AB-0007" }
```

## 3. Count the digits in a code

Define `digit-count`, taking a string and returning how many digits it
contains.

```factor
"NS-1024" digit-count .   ! => 4
```

## 4. Redact passwords

Log lines sometimes record a password as `pass=` followed by the
secret (any run of non-space characters). Define `redact`, taking a
line and returning it with every such password replaced by
`pass=****`.

```factor
"user=alice pass=hunter2 ok" redact .
! => "user=alice pass=**** ok"
```
