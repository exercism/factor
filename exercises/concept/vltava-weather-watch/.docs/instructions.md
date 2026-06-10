# Instructions

You run a little weather post on the bank of the Vltava in Prague, and every
shift you jot the temperature readings into a plain-text log — one reading per
line. Five small words handle a shift's worth of bookkeeping.

Each word is handed the path to the log file.

## 1. Read every reading

Define `read-readings` to return all of the log's readings as an array of
strings, one per line.

```factor
"weather.log" read-readings .
! => { "21.5" "19.0" "22.3" }
```

## 2. Find the latest reading

Define `latest-reading` to return the most recent reading — the last line of
the log.

```factor
"weather.log" latest-reading .
! => "22.3"
```

## 3. Read the raw log

Define `log-text` to return the whole log file as a single string, exactly as
stored.

```factor
"weather.log" log-text .
! => "21.5\n19.0\n22.3\n"
```

## 4. Record a reading

Define `record-reading` to append a new reading to the end of the log as its
own line, leaving the earlier readings untouched. Returns nothing.

```factor
"23.1" "weather.log" record-reading
"weather.log" log-text .
! => "21.5\n19.0\n22.3\n23.1\n"
```

## 5. Rewrite the log

Define `rewrite-log` to replace the whole log with a fresh array of readings,
one per line.

```factor
{ "10.0" "11.0" } "weather.log" rewrite-log
"weather.log" log-text .
! => "10.0\n11.0\n"
```
