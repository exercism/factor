# Instructions

In this exercise you'll be writing code to analyze the production of
an assembly line in a car factory. The assembly line's speed can range
from `0` (off) to `10` (maximum).

At its lowest non-zero speed (`1`), `221` cars are produced each hour.
The production increases linearly with the speed, so at speed `4` the
line produces `4 * 221 = 884` cars per hour. However, higher speeds
increase the likelihood that faulty cars are produced, which then
have to be discarded.

You have three tasks. Each takes a single integer parameter — the
speed of the assembly line — off the stack.

## 1. Calculate the success rate

Define `success-rate` to return the probability of an item being
produced without error:

- `0`: `0.0`
- `1` to `4`: `1.0`
- `5` to `8`: `0.9`
- `9`: `0.8`
- `10`: `0.77`

```factor
10 success-rate .
! => 0.77
```

## 2. Calculate the production rate per hour

Define `production-rate-per-hour` to return the assembly line's
production rate per hour, taking the success rate into account.

You'll need to define `base-speed` first, the constant `221`.

```factor
6 production-rate-per-hour .
! => 1193.4
```

The value returned is floating-point.

## 3. Calculate the number of working items produced per minute

Define `working-items-per-minute` to return how many working cars are
produced per minute. The result is an integer — partial cars are not
counted.

```factor
6 working-items-per-minute .
! => 19
```
