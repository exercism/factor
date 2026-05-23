# Instructions

You're the signaler on a coastal patrol vessel. Today's satchel
needs five small words ready before the morning watch begins.

## 1. Quote a value

The log book records every observation in *Factor source form* —
the same text the parser will read back. Define `quote-value` to
turn any value into its source-form string.

```factor
123 quote-value .   ! => "123"
"hi" quote-value .  ! => "\"hi\""
```

## 2. Strip the flag framing

Incoming signal flags arrive framed with a marker character at
each end. Define `flag-body` to return everything *between* the
two markers — drop the first character, drop the last character.

Return a slice (a view) rather than copying.

```factor
"#NS-1024#" flag-body .   ! => "NS-1024"
```

## 3. Split a flag

Each flag carries a short prefix code followed by the payload.
Define `split-flag` to take a flag and a header length, and
return *both* the header slice and the body slice.

```factor
"NS-1024" 2 split-flag .s
! => "NS"
! => "-1024"
```

## 4. Triangulate from two readings

Two consecutive signal readings give three derived measurements:
their **difference** (`a - b`), their **midpoint** (`(a + b) / 2`),
and their **ratio** (`a / b`). Each measurement uses *both*
readings.

Define `triangulate` to return all three from a pair of readings.

```factor
100 50 triangulate .s
! => 50
! => 75
! => 2
```

## 5. Summarise three readings

Three consecutive readings get summarised as their **sum**,
**product**, and **maximum**. Each statistic uses all three
readings.

Define `triangle-stats` to return all three.

```factor
5 3 8 triangle-stats .s
! => 16
! => 120
! => 8
```
