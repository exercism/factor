# Hints

## General

- The date words are in the [`calendar`][calendar] vocabulary;
  `day-names` is in [`calendar.english`][english].

## 1. Record a sailing date

- `<date>` takes the year, month, and day directly.

## 2. Name the weekday

- `day-of-week` gives a number from `0` (Sunday) to `6` (Saturday).
- Use it as an index into `day-names` with `nth`.

## 3. Leap years

- `leap-year?` already implements the rule for you.

## 4. Days in a month

- Build a timestamp for the first of the month with `<date>`, then ask
  `days-in-month`. It handles February in leap years for you.

## 5. Days later

- `days` turns a number into a `duration`; `time+` adds a duration to a
  timestamp.

[calendar]: https://docs.factorcode.org/content/vocab-calendar.html
[english]: https://docs.factorcode.org/content/vocab-calendar.english.html
