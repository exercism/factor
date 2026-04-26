# Introduction

Strings in Factor are sequences of characters. Most words from the
`sequences` vocabulary work on them, plus dedicated string-handling
words in [`splitting`][splitting], [`ascii`][ascii], and friends.

```factor
"hello, world" .              ! => "hello, world"
"foo: bar" ": " split1 .s     ! => "foo" / "bar"
"WARNING" >lower .            ! => "warning"
"  spaced  " [ blank? ] trim . ! => "spaced"
"a" "b" "(" ")" surround .    ! => "(b)"... err, surround takes 3
```

`split1` cuts a string on the first occurrence of a separator,
`split` cuts on any of a set of characters, `surround` wraps a
string with a prefix and suffix, and `glue` joins two strings with
a separator.

[splitting]: https://docs.factorcode.org/content/vocab-splitting.html
[ascii]: https://docs.factorcode.org/content/vocab-ascii.html
