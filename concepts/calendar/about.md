# About

Factor's [`calendar`][calendar] vocabulary is built around two tuples:

- `timestamp` — a point in time (`year`, `month`, `day`, `hour`,
  `minute`, `second`, and a GMT offset).
- `duration` — a span of time (the same fields, used as amounts).

## Timestamps

`<date>` builds a midnight timestamp; `>date<` splits one apart:

```
<date> ( year month day -- timestamp )
>date< ( timestamp -- year month day )
```

```factor
USING: calendar ;

2024 7 14 <date> >date< .   ! => 14   (2024 and 7 below it)
```

Common queries:

```factor
USING: calendar calendar.english sequences ;

2024 1 8 <date> day-of-week .          ! => 1   (0 = Sunday .. 6 = Saturday)
2024 1 8 <date> day-of-week day-names nth .   ! => "Monday"
2024 leap-year? .                      ! => t
2024 2 1 <date> days-in-month .        ! => 29
```

`day-names` (and `month-names`) live in
[`calendar.english`][english].

## Durations and arithmetic

Words like `days`, `weeks`, `hours`, and `minutes` build a `duration`,
and `time+` / `time-` shift a timestamp by one:

```
days  ( x -- duration )
time+ ( timestamp duration -- timestamp )
```

```factor
2024 2 28 <date> 1 days time+ >date< .   ! => 29   (2024-02-29)
```

Arithmetic carries across month and year boundaries, and two
timestamps naming the same instant compare equal with `=`.

Beyond these, `calendar` offers times of day (`set-time`, `+hour`),
time-zone conversions (`>gmt`, `>local-time`), the current time
(`now`), and — via `calendar.format` — parsing and formatting.

[calendar]: https://docs.factorcode.org/content/vocab-calendar.html
[english]: https://docs.factorcode.org/content/vocab-calendar.english.html
