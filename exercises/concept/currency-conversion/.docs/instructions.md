# Instructions

Your friend Chandler plans to visit exotic countries all around the
world. Sadly, Chandler's math skills aren't good. He's pretty worried
about being scammed by currency exchanges during his trip — and he
wants you to make a currency calculator for him.

## 1. Estimate value after exchange

Define `exchange-money` taking a `budget` and an `exchange-rate` and
returning the value of the exchanged currency.

**Note:** if your currency is USD and you want to exchange USD for EUR
with an exchange rate of `1.20`, then `1.20 USD == 1 EUR`.

```factor
127.5 1.2 exchange-money .
! => 106.25
```

## 2. Calculate currency left after an exchange

Define `get-change` taking a `budget` (before the exchange) and the
`exchanging-value` (the amount taken from the budget to be exchanged).
Return the amount of money that is left.

```factor
127.5 120 get-change .
! => 7.5
```

## 3. Calculate value of bills

Define `value-of-bills` taking a `denomination` (the value of a single
bill) and a `number-of-bills`. Return the total value of the bills.

```factor
5 128 value-of-bills .
! => 640
```

## 4. Calculate number of bills

Define `number-of-bills` taking an `amount` and a `denomination`.
Return the number of *whole bills* of the given denomination that fit
into the amount. Round down — fractional bills don't exist.

```factor
127.5 5 number-of-bills .
! => 25
```

## 5. Calculate leftover after exchanging into bills

Define `leftover-of-bills` taking an `amount` and a `denomination`.
Return the leftover amount that cannot be returned as whole bills.

```factor
127.5 20 leftover-of-bills .
! => 7.5
```

## 6. Calculate value after exchange

Define `exchangeable-value` taking a `budget`, `exchange-rate`,
`spread`, and `denomination`.

`spread` is the *percentage* taken as an exchange fee, written as an
integer. It needs to be added to the exchange rate as a fraction. If
`1.00 EUR == 1.20 USD` and the spread is `10`, the total exchange rate
is `1.00 EUR == 1.32 USD` (10% of 1.20 is 0.12, added to 1.20).

Return the maximum value of the new currency after applying the rate
plus spread, rounded down to whole bills of the given `denomination`.
The returned value is an integer.

```factor
127.25 1.20 10 20 exchangeable-value .
! => 80

127.25 1.20 10 5 exchangeable-value .
! => 95
```

## 7. Safe change

Like `get-change`, but if Chandler accidentally typed an
exchanging value larger than his budget, return `0` instead of
a negative number. Define `safe-change` taking a `budget` and an
`exchanging-value`.

```factor
127.5 120 safe-change .
! => 7.5

50 100 safe-change .
! => 0
```

## 8. Cap by budget

Chandler is haggling for a souvenir. Define `cap-spend` taking a
`budget` and a `price`, and returning whichever is smaller — the
most he can actually pay.

```factor
100 30 cap-spend .
! => 30

20 30 cap-spend .
! => 20
```
