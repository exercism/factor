# About

`call` is the universal "run this quotation now" primitive. When
the compiler can see the quotation literally, it can infer the
effect; when the quotation comes from a variable, an array, or a
parameter, you must declare the effect:

```factor
: apply-binary ( a b op -- c )
    call( a b -- c ) ;

5 3 [ - ] apply-binary .   ! => 2
5 3 [ + ] apply-binary .   ! => 8
```

The declaration `call( a b -- c )` compiles to a runtime check that
the quotation actually has the declared effect — a mismatch becomes
a clear error rather than corrupted stack state.

Treating quotations as data — pushing them, putting them in arrays,
returning them from words — is one of the things that makes
concatenative code so compact. A "program" can be a plain sequence,
and `each`-with-`call` is enough to interpret it.
