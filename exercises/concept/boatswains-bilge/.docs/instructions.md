# Instructions

You're the boatswain on a coastal freighter. The bilge — the
lowest compartment of the hull — collects wastewater, and every
shift the bilge gear has to be opened, run, and stowed away.
Whatever happens mid-pump, the equipment *must* end up back in
its stowed state.

The tests give you `<test-pump>` to acquire fresh pumps. Each
pump has an `opened>>` slot that reads `t` while open and `f`
once it's been disposed.

## 1. Drain the bilge

Define `drain-bilge` to release a single pump. Calling
`drain-bilge` on the same pump twice should be harmless — the
framework handles that for you.

```factor
<test-pump> dup drain-bilge opened>> .   ! => f
```

## 2. Pump-out routine

Define `pump-out` to take a pump and a quotation, push the pump
onto the stack for the quotation to use, and release the pump
after — *even if the quotation throws*.

```factor
<test-pump> [ drop ] pump-out   ! pump released
```

## 3. Whole-shift routine

Define `shift-routine` to take two pumps and a quotation. Open a
destructor scope, register *both* pumps for unconditional
release, then call the quotation. Both pumps end up released
whether the quotation finishes normally or throws.

The quotation receives both pumps on the stack as inputs.

```factor
<test-pump> <test-pump> [ 2drop ] shift-routine
! both pumps released
```

## 4. Risky pump-out

Sometimes a pump is on loan — you only want to discard it if
something goes wrong, otherwise the next watch needs it left
open. Define `risky-pump-out` to take a pump and a quotation,
register the pump for **failure-only** release, and call the
quotation with the pump on the stack.

If the quotation succeeds, the pump stays open. If the quotation
throws, the pump is released and the exception propagates.

```factor
<test-pump> [ drop ] risky-pump-out                ! stays open
<test-pump> [ drop "boom" throw ] risky-pump-out   ! pump released, throws
```

## 5. A custom disposable: the valve

Round out the toolkit with a brand-new disposable — a `valve`.
The tuple is declared for you:

```factor
TUPLE: valve < disposable is-open ;
```

- Define `<valve> ( -- valve )` to construct a fresh valve via
  `new-disposable`, with `is-open` set to `t`.
- Implement `M: valve dispose*` to flip `is-open` to `f`.

```factor
<valve> is-open>> .                ! => t
<valve> dup dispose is-open>> .    ! => f
```
