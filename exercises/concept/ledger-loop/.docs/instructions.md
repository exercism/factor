# Instructions

You're keeping the ledger for a small co-op. Two kinds of work
land on your desk each week:

- A queue of **requests** — proposed deposits and withdrawals
  that members hand in. The co-op's account is *overdraft-
  protected*, so a withdrawal larger than the current balance is
  honoured only up to the available amount; the resulting
  balance never drops below zero.
- A list of **transactions** — entries that have already been
  recorded. These are unconditional: positive amounts are
  deposits, negative amounts are withdrawals.

Each week you tally the books: a final balance after honouring
the requests, a per-day running balance from the transactions,
and a running low-water mark to flag risky stretches.

## 1. Honour the request queue

Define `protected-balance` to take an `opening` balance and an
array of `requests` (signed amounts) and return the final
balance after honouring each request in turn. A withdrawal that
would push the balance below zero is honoured only up to the
available amount, so the running balance floors at zero.

```factor
100 { 50 -200 30 } protected-balance .
! => 30

500 { 100 -300 -250 } protected-balance .
! => 50

0 { -10 50 } protected-balance .
! => 50
```

## 2. Running balance

Define `running-balance` to take an array of `transactions` and
return a sequence of the same length whose `i`-th element is the
balance after the first `i+1` transactions (relative to a zero
starting balance).

```factor
{ 50 -30 -20 100 } running-balance .
! => { 50 20 0 100 }
```

## 3. Least balance so far

Define `least-balance-so-far` to take an array of `transactions`
and return a sequence of the same length whose `i`-th element is
the *lowest* running balance seen up to and including position
`i`. This is the running low-water mark — useful for spotting
days when the account looked risky.

```factor
{ 50 -30 -20 100 } least-balance-so-far .
! => { 50 20 0 0 }

{ 200 -50 -100 -200 } least-balance-so-far .
! => { 200 150 50 -150 }
```
