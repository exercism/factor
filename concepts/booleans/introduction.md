# Introduction

Factor has two boolean values: `t` (true) and `f` (false). Anywhere
a "yes/no" answer is needed, words push one of these onto the
stack.

The boolean operators live in [`kernel`][kernel]:

```
and ( a b -- ? )
or  ( a b -- ? )
not ( a -- ? )
```

```factor
t f and .   ! => f
t f or .    ! => t
f not .     ! => t
```

`f` is also Factor's only *falsy* value. Every other value — empty
strings, zero, empty arrays — is treated as truthy.

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
