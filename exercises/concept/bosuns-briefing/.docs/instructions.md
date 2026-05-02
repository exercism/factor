# Instructions

The bosun runs a daily watch briefing on the deck: a fixed
greeting, a roll-call of the crew on duty, then a closing
dismissal. You'll factor the briefing into small named lines and
compose them.

You'll be editing **two files** for this exercise:

- `bosuns-briefing/helpers/helpers.factor` — small reusable
  pieces. Vocabulary: `bosuns-briefing.helpers`.
- `bosuns-briefing/bosuns-briefing.factor` — the main file that
  composes the helpers. Vocabulary: `bosuns-briefing`.

## 1. Greeting

In `helpers.factor`, define `greeting` to return the fixed
opening string `"All hands, attention!"`.

```factor
greeting .
! => "All hands, attention!"
```

## 2. Crew line

In `helpers.factor`, define `crew-line` to take a name string and
return that name prefixed with `"  - "` (two spaces, a hyphen, a
space).

```factor
"Lopez" crew-line .
! => "  - Lopez"
```

## 3. Closing

In `helpers.factor`, define `closing` to return the fixed
dismissal string `"Carry on."`.

```factor
closing .
! => "Carry on."
```

## 4. Roster

In `bosuns-briefing.factor`, define `roster` to take an array of
crew names and return a single multi-line string with each name
formatted by `crew-line`, joined by newlines.

```factor
{ "Lopez" "Mwangi" } roster .
! => "  - Lopez\n  - Mwangi"

{ } roster .
! => ""
```

## 5. Briefing

In `bosuns-briefing.factor`, define `briefing` to take an array
of crew names and return the full briefing as a single string:
the greeting on the first line, the roster on the next lines,
and the closing on the last line. Use the helpers and `roster`.

```factor
{ "Lopez" "Mwangi" } briefing .
! => "All hands, attention!\n  - Lopez\n  - Mwangi\nCarry on."

{ } briefing .
! => "All hands, attention!\n\nCarry on."
```
