# Introduction

Strings in Factor are sequences of characters. Most words from the
`sequences` vocabulary work on them, plus dedicated string-handling
words in [`splitting`][splitting], [`ascii`][ascii], and friends.

```factor
USING: ascii sequences splitting ;

"hello, world" .                  ! => "hello, world"
"foo: bar" ": " split1 .s
! => "foo"
! => "bar"
"WARNING" >lower .                ! => "warning"
"  spaced  " [ blank? ] trim .    ! => "spaced"
"warning" "(" ")" surround .      ! => "(warning)"
```

`split1` and `split` (in [`splitting`][splitting]) cut a string —
`split1` on the first occurrence of a separator, `split` on any of a
set of characters. `surround` and `glue` (in [`sequences`][sequences])
build strings — `surround` wraps a string with a prefix and suffix,
and `glue` joins two strings with a separator. The [About](./about.md)
page lists each string word alongside the vocabulary it lives in.

[splitting]: https://docs.factorcode.org/content/vocab-splitting.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[ascii]: https://docs.factorcode.org/content/vocab-ascii.html
