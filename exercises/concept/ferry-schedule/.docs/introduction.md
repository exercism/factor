# Introduction

Factor models dates and times with the [`calendar`][calendar]
vocabulary. A point in time is a `timestamp`; a span of time is a
`duration`.

## Building a date

`<date>` (in [`calendar`][calendar]) builds a `timestamp` at midnight
on the given day:

```
<date> ( year month day -- timestamp )
```

```factor
USING: calendar ;

1904 11 16 <date> .
! a timestamp at midnight on 1904-11-16
```

`>date<` splits a timestamp back into its parts:

```
>date< ( timestamp -- year month day )
```

```factor
1904 11 16 <date> >date< .   ! => 16   (with 1904 and 11 below it)
```

## Inspecting a date

`day-of-week` returns the weekday as an integer, `0` for Sunday
through `6` for Saturday. `day-names` (in [`calendar.english`][english])
is the matching list of names, so `day-names nth` turns the number
into a word:

```factor
USING: calendar calendar.english sequences ;

2024 1 8 <date> day-of-week .          ! => 1
day-names .   ! { "Sunday" "Monday" ... "Saturday" } — Sunday first
```

`leap-year?` accepts a year (or a timestamp) and `days-in-month`
returns the length of a timestamp's month — already accounting for
leap years:

```
leap-year?    ( obj -- ? )
days-in-month ( timestamp -- n )
```

```factor
2024 leap-year? .                ! => t
2024 2 1 <date> days-in-month .  ! => 29
```

## Date arithmetic

Words like `days`, `weeks`, and `hours` build a `duration`, and
`time+` shifts a timestamp by one:

```
days  ( x -- duration )
time+ ( timestamp duration -- timestamp )
```

```factor
2024 2 28 <date> 1 days time+ >date< .
! => 29   (2024-02-29, with 2024 and 2 below it)
```

Arithmetic carries correctly across month and year boundaries, and
two timestamps that name the same instant compare equal with `=`.

## Times of day

`<timestamp>` builds a full timestamp, down to the second. Its last
argument is the offset from UTC; `instant` (a zero `duration`) keeps
the timestamp at UTC:

```
<timestamp> ( year month day hour minute second gmt-offset -- timestamp )
```

```factor
USING: calendar ;

1969 7 21 2 56 15 instant <timestamp> .
! a timestamp at 02:56:15 on 1969-07-21
```

`>time<` is the counterpart to `>date<`, splitting a timestamp into
its hour, minute, and second:

```
>time< ( timestamp -- hour minute second )
```

```factor
1969 7 21 2 56 15 instant <timestamp> >time< .   ! => 15   (with 2 and 56 below it)
```

`seconds` and `minutes` build a `duration` just like `days`, `weeks`,
and `hours`, so any of them can be handed to `time+`:

```
seconds ( x -- duration )
minutes ( x -- duration )
```

The individual fields of a timestamp are read with the accessors
`year>>`, `month>>`, `day>>`, `hour>>`, `minute>>`, and `second>>`:

```factor
1969 7 21 2 56 15 instant <timestamp> hour>> .   ! => 2
```

[calendar]: https://docs.factorcode.org/content/vocab-calendar.html
[english]: https://docs.factorcode.org/content/vocab-calendar.english.html
