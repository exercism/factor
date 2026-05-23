# Instructions

You're maintaining a signal station's code-generation toolkit.
Each macro is a *stencil* — a small template the compiler uses
to stamp out specialised code at every call site.

The test file defines wrapper words that call your macros, and
asserts the wrappers' runtime behaviour. You only need to write
the macros themselves.

## 1. Twice over

Define `twice` as a macro that takes a literal quotation and
returns a quotation that runs the original twice in sequence.

```factor
! With `: inc-twice ( x -- y ) [ 1 + ] twice ;`
5 inc-twice .   ! => 7
```

## 2. N repetitions

Define `repeat-quot` to take a literal quotation and a literal
count, and return a quotation that runs the original `n` times
in sequence. `n = 0` is allowed and returns the empty quotation.

```factor
! With `: inc-thrice ( x -- y ) [ 1 + ] 3 repeat-quot ;`
5 inc-thrice .   ! => 8
```

## 3. Compose many

Define `compose-many` to take a literal array of quotations and
return a single quotation that runs each in turn.

```factor
! With `: pipeline ( x -- y ) { [ 1 + ] [ 2 * ] [ 1 - ] } compose-many ;`
5 pipeline .   ! => 11
```

An empty input array returns the empty quotation.

## 4. Unrolled iteration

Define `each-literal` to take a literal sequence and a
quotation, and return a quotation that for each element of the
sequence, pushes that element and runs the quotation. The
sequence iteration happens at compile time — the resulting
code is straight-line.

```factor
! With `: sum-three ( -- n ) 0 { 10 20 30 } [ + ] each-literal ;`
sum-three .   ! => 60
```

This is the most structural of the four: both the sequence's
length and its element values shape the generated code.
