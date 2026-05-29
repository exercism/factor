# About

`TUPLE: child < parent extra-slots ;` declares a class whose
instances are also instances of `parent`. Slot lookup walks the
hierarchy: a `child` has every slot the parent declared, plus
its own, in that order.

```factor
TUPLE: vessel name tonnage ;
TUPLE: cargo-vessel < vessel capacity ;
TUPLE: tanker < cargo-vessel fuel-type ;
```

## `boa` argument order

The auto-generated `boa` constructor takes slots in declaration
order, *parents first*. For `tanker` above:

```
tanker boa ( name tonnage capacity fuel-type -- tanker )
```

The slot order is fixed by the inheritance chain — there's no
way to interleave parent and child slots, and reordering a
parent's slots is a breaking change for every descendant's
`boa`.

## Predicate hierarchy

Every `TUPLE:` declaration generates a class predicate
(`name?`). With inheritance the predicates nest:

```factor
"Esso" 50000 100000 "diesel" tanker boa .

! all three predicates fire
dup tanker?        .   ! => t
dup cargo-vessel?  .   ! => t
dup vessel?        .   ! => t
```

The transitive `is-a` relationship is also what `M:` method
dispatch walks — a method defined on `vessel` applies to every
`cargo-vessel` and every `tanker`, unless a more-specific
override fires first. That side of the story is in
[`generics`][generics].

## Accessor inheritance

Accessor words (`slot>>`, `>>slot`, `change-slot`) come from
[`accessors`][accessors] and aren't tied to the class they
were generated for: any tuple that *has* the slot can use them.

```factor
USING: accessors ;

"Esso" 50000 100000 "diesel" tanker boa
[ 1 + ] change-tonnage tonnage>> .   ! => 50001
```

`change-tonnage` was generated for `vessel`, but it works on a
`tanker` because every `tanker` is a `vessel`.

## What this isn't

- **Mixins** (`MIXIN:` / `INSTANCE:`) — a class can join many
  mixins; the relationship is many-to-many and used mainly for
  generic dispatch over a shared protocol. The streams concept
  introduces them in context.
- **Predicate classes** (`PREDICATE:`) — carve a subclass out of
  an existing class by a runtime predicate. A separate Factor
  feature; not covered here.

[generics]: https://docs.factorcode.org/content/article-generic.html
[accessors]: https://docs.factorcode.org/content/vocab-accessors.html
