# Instructions

You keep the books for a small company, and each day's transactions
arrive as untidy lines of text. You'll use regular expressions to
validate amounts, pull figures out by the symbol that marks them, and
flag lines that need a closer look.

## 1. Validate an amount

A well-formed amount is a `$`, one or more digits, and an *optional*
cents part of a dot followed by exactly two digits — `$100` or
`$100.50`, but not `$100.5`. Define `valid-amount?`, returning `t`
when the *whole* string is a well-formed amount.

```factor
"$100.50" valid-amount? .   ! => t
"$100"    valid-amount? .   ! => t
"$100.5"  valid-amount? .   ! => f
```

## 2. Pull out the dollar figures

Define `dollar-amounts`, returning every number that directly follows
a `$` in the line — the digits only, without the `$` — in order.

```factor
"spent $100 and $25 today" dollar-amounts .
! => { "100" "25" }
```

## 3. Pull out the percentages

Define `percentages`, returning every number that is immediately
followed by a `%`.

```factor
"up 5% then down 12%" percentages .
! => { "5" "12" }
```

## 4. Flag a line

Define `flagged?`, returning `t` when the line mentions `refund` or
`chargeback` in any mix of upper- and lower-case.

```factor
"Issued a REFUND today" flagged? .   ! => t
"a normal sale"         flagged? .   ! => f
```
