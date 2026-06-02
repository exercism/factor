# Hints

## General

- `MACRO:` is in [`macros`][macros]. The building blocks live in
  `kernel` (`dup`, `curry`), `sequences` (`append`, `concat`,
  `<repetition>`, `map`), and `quotations` (`>quotation`).
- A macro body must leave **one quotation** on the stack. If your
  body produces an array of code, finish with `>quotation`.
- To check your thinking, run the body's words on a literal in the
  listener and look at the quotation you get back — it should be
  the straight-line code from the task's "compiles to" line.

## 1. Twice over

- You receive `[ A ]` and want `[ A A ]`. Make a copy and join
  them: `dup append`.

## 2. N repetitions

- You receive `[ A ] n` and want `n` copies joined together.
- `<repetition>` builds the copies, but its effect is
  `( length elt -- repetition )` — the count must be on top, so
  `swap` first.
- Then flatten and convert: `swap <repetition> concat >quotation`.

  ```factor
  ! stack: [ 1 + ] 3
  swap <repetition>     ! 3 copies of [ 1 + ]
  concat >quotation     ! => [ 1 + 1 + 1 + ]
  ```

## 3. Compose many

- You already receive the array of quotations; you only need to
  flatten it into one. `concat >quotation` is the whole body.

## 4. Unrolled iteration

You receive a sequence and a quotation, e.g. `{ 10 20 30 } [ + ]`,
and want `[ 10 + 20 + 30 + ]`. Build it up in three moves.

**One element.** Baking an element into the quotation is exactly
what `curry` does:

```factor
10 [ + ] curry .   ! => [ 10 + ]
```

**Every element.** You want to `map` that over the sequence — but
`map` only hands the mapping quotation one input (the element),
while you also need `[ + ]` on hand each time. So bake `[ + ]` into
the mapping quotation first, again with `curry`:

```factor
! stack: { 10 20 30 } [ + ]
[ curry ] curry    ! => { 10 20 30 } [ [ + ] curry ]
map                ! runs  10 [ + ] curry,  20 [ + ] curry, …
                   ! => { [ 10 + ] [ 20 + ] [ 30 + ] }
```

`[ curry ] curry` reads as "push the little quotation `[ curry ]`,
then curry `[ + ]` into it", giving `[ [ + ] curry ]`. Mapping that
over an element `e` runs `e [ + ] curry`, which is `[ e + ]`.

**Join them.** Same finish as the other tasks:

```factor
concat >quotation  ! => [ 10 + 20 + 30 + ]
```

- The whole body: `[ curry ] curry map concat >quotation`.

[macros]: https://docs.factorcode.org/content/vocab-macros.html
