# Introduction

A *generic word* declares an operation that can have different
implementations depending on the class of its argument. Methods
are added with `M:`.

```factor
USING: kernel math ;

GENERIC: area ( shape -- n )

TUPLE: square side ;
TUPLE: circle radius ;

M: square area side>> dup * ;
M: circle area radius>> dup * 3.14159 * ;
```

```factor
T{ square { side 4 } } area .    ! => 16
T{ circle { radius 2 } } area .  ! => 12.56636
```

`GENERIC:` declares the word and its stack effect. `M:` defines a
method on a specific class — Factor dispatches on the class of
the topmost argument at runtime.

You can ask the generic which classes it has methods for, and add
or remove methods after the fact. There's no special inheritance
syntax: any tuple class is automatically eligible to have methods
defined on it.
