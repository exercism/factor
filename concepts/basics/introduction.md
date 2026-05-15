# Introduction

Factor is a *concatenative* language: every word reads its inputs
from the data stack and pushes its outputs back onto it.

A *stack effect* declaration documents that contract:

```factor
: square ( x -- x*x ) dup * ;
```

`( x -- x*x )` says the word consumes one value (named `x`) and
produces one (named `x*x`). The names are documentation — only the
*number* of inputs and outputs is checked by the compiler.

Words are defined with `:` and end in `;`:

```factor
: hello ( -- ) "Hello, world!" print ;
```

The compiler will refuse a definition whose body doesn't match the
declared effect.
