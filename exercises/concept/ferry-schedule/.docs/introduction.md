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

2024 7 14 <date> .
! a timestamp at midnight on 2024-07-14
```

`>date<` splits a timestamp back into its parts:

```
>date< ( timestamp -- year month day )
```

```factor
2024 7 14 <date> >date< .   ! => 14   (with 2024 and 7 below it)
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

[calendar]: https://docs.factorcode.org/content/vocab-calendar.html
[english]: https://docs.factorcode.org/content/vocab-calendar.english.html
