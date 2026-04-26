# Instructions

Elena, the new quality manager at a newspaper factory, asks you to
write a small piece of software to monitor the production room.

## 1. Check the humidity

Define `check-humidity`. It takes a humidity reading off the stack
and `throw`s the string `"humidity too high"` when the reading is
strictly greater than `70`. Otherwise, it returns nothing.

```factor
50 check-humidity   ! returns nothing
80 check-humidity   ! throws "humidity too high"
```

## 2. Check the temperature

Define `check-temperature`. It takes a temperature reading and
`throw`s the string `"temperature too high"` when the reading is
strictly greater than `500`. Otherwise, it returns nothing.

```factor
400 check-temperature   ! returns nothing
600 check-temperature   ! throws "temperature too high"
```

## 3. Define a custom error

Define an error tuple class `machine-error` using the `ERROR:` parsing
word. It needs no slots.

```factor
machine-error   ! throws a fresh machine-error
```

## 4. Monitor the machine

Define `monitor` to take a humidity and temperature off the stack and
run both checks. If either check throws, `monitor` should throw a
fresh `machine-error` instead. If both pass, `monitor` returns
nothing.

```factor
50 400 monitor   ! returns nothing
80 400 monitor   ! throws a machine-error
50 600 monitor   ! throws a machine-error
```

## 5. Monitor a batch of readings

Define `monitor-batch` to take an array of `{ humidity temperature }`
readings and return how many of them would fail (i.e., how many would
cause `monitor` to throw).

```factor
{ { 50 400 } { 80 400 } { 50 600 } { 60 200 } } monitor-batch .
! => 2
```
