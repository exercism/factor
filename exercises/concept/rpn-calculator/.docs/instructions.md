# Instructions

You're building a small Reverse Polish Notation (RPN) calculator.
The calculator's state is a *stack of values* — represented as a
Factor array — and an *operation* is a quotation that takes such a
stack and returns a new one.

```factor
{ 3 4 }   ! the calculator's stack: 3 is below 4
[ ... ]   ! an operation that consumes some values and pushes a result
```

## 1. Implement addition

Define `add-op` to pop the top two values from the stack, push their
sum, and return the new stack.

```factor
{ 3 4 } add-op .
! => { 7 }

{ 1 2 3 4 } add-op .
! => { 1 2 7 }
```

## 2. Implement multiplication

Define `multiply-op` the same way but for multiplication.

```factor
{ 3 4 } multiply-op .
! => { 12 }
```

## 3. Apply a single operation

Define `apply-op` to take a stack and an operation (a quotation) off
the data stack and return the new calculator stack.

```factor
{ 3 4 } [ add-op ] apply-op .
! => { 7 }
```

## 4. Evaluate a program

Define `evaluate` to take a starting stack and an array of operations
and apply each operation in turn, returning the final stack.

```factor
{ 3 4 5 } { [ add-op ] [ multiply-op ] } evaluate .
! => { 27 }
```

## 5. Evaluate by name

Now the program is a list of *operator names* (strings), and the
calculator looks each name up in an assoc that maps names to
operations.

Define `evaluate-named` to take a starting stack, an assoc of named
operations, and an array of names, and return the final stack.

```factor
{ 3 4 5 } H{ { "+" [ add-op ] } { "*" [ multiply-op ] } } { "+" "*" }
evaluate-named .
! => { 27 }
```

## 6. Divide with safety

A real calculator must not silently produce garbage when asked to
divide by zero. Define an error class `zero-divisor-error` (no
slots) and `divide-op` analogous to `add-op` and `multiply-op`,
except that it `throw`s a fresh `zero-divisor-error` when the
divisor on top of the stack is `0`.

```factor
{ 12 4 } divide-op .
! => { 3 }

{ 1 5 6 2 } divide-op .
! => { 1 5 3 }

{ 5 0 } divide-op
! throws zero-divisor-error
```
