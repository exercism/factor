# Instructions

You're the librarian, keeping the patron-accounts ledger. Two
kinds of work land on your desk each week:

- A queue of **requests** — credits a patron asks to apply (book
  returns, paid fines) and new debits the system has logged
  (newly accrued overdue fines). The patron's account is
  *credit-protected*: a credit large enough to push the patron
  into the red is applied only up to what's owed, so the running
  balance never drops below zero.
- A list of **transactions** — entries already recorded against
  the account. Positive amounts are debits (new fines), negative
  amounts are credits (payments).

Each week you tally the books: a final balance after honouring
the requests, a per-day running balance from the transactions,
and a running low-water mark to flag stretches when fines
spiked.

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

## 4. Halve until target

The library is running a fine-amnesty programme: a patron's
outstanding balance is halved each pay period until it falls to
or below a forgiveness threshold. Define `halve-until` to take a
`principal` and a `target`, and return the sequence of halved
values (using integer division) starting from the first halving,
continuing as long as the running value is still strictly above
`target`. The last emitted value will be the first one that
drops to or below `target`.

```factor
100 5 halve-until .
! => { 50 25 12 6 3 }

64 1 halve-until .
! => { 32 16 8 4 2 1 }

3 5 halve-until .
! => { }
```

