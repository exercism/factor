# Instructions

You're maintaining a signal station's code-generation toolkit.
Each macro is a *stencil* — a small template the compiler uses to
stamp out specialised code at every call site.

You only write the four macros. The test file defines small
wrapper words that *call* your macros (a macro can only be
observed through the code it generates), then checks the
wrappers' runtime results. Leave the wrappers as they are.

For each task, the body receives the call site's literal inputs
on the stack and must leave **one quotation**. The "compiles to"
lines show the straight-line code your quotation should produce.

## 1. Twice over

`twice` takes a literal quotation and returns a quotation that
runs the original twice in a row.

```factor
! : inc-twice ( x -- y ) [ 1 + ] twice ;
! body receives [ 1 + ]  ->  must build [ 1 + 1 + ]
5 inc-twice .   ! => 7
```

## 2. N repetitions

`repeat-quot` takes a literal quotation and a literal count `n`,
and returns a quotation that runs the original `n` times in a row.
`n = 0` returns the empty quotation `[ ]`.

```factor
! : inc-thrice ( x -- y ) [ 1 + ] 3 repeat-quot ;
! body receives [ 1 + ] 3  ->  must build [ 1 + 1 + 1 + ]
5 inc-thrice .   ! => 8
```

## 3. Compose many

`compose-many` takes a literal array of quotations and returns a
single quotation that runs each one in turn. An empty array
returns the empty quotation.

```factor
! : pipeline ( x -- y ) { [ 1 + ] [ 2 * ] [ 1 - ] } compose-many ;
! body receives { [ 1 + ] [ 2 * ] [ 1 - ] }  ->  must build [ 1 + 2 * 1 - ]
5 pipeline .   ! => 11
```

## 4. Unrolled iteration

`each-literal` takes a literal sequence and a quotation. It
returns a quotation that, for each element of the sequence, pushes
that element and then runs the quotation — iteration that happens
at compile time, so the generated code is straight-line.

```factor
! : sum-three ( -- n ) 0 { 10 20 30 } [ + ] each-literal ;
! body receives { 10 20 30 } [ + ]  ->  must build [ 10 + 20 + 30 + ]
sum-three .   ! => 60
```

This is the most structural of the four: both the sequence's
length *and* its element values shape the generated code. The
hints walk through building it one step at a time.
