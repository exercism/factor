# Introduction

A string in Factor is a sequence of characters. Most words from the
`sequences` vocabulary work on strings, in addition to the dedicated
string-handling words in `splitting`, `ascii`, and friends.

## String literals

Strings are written in double quotes. The usual escapes are supported
— `\n`, `\t`, `\r`, `\\`, `\"`:

```factor
"hello, world" .                 ! => "hello, world"
"first\nsecond" print            ! prints two lines
```

## Splitting

The [`splitting`][splitting] vocabulary cuts a string into pieces.

`split1` cuts on the *first* occurrence of a separator and returns
both halves:

```
split1 ( seq subseq -- before after )
```

```factor
"foo: bar" ": " split1 .s
! => "foo"
! => "bar"
```

`split` cuts on *any* of the characters in a separator set, possibly
producing empty pieces:

```factor
"[ERROR]: Stack overflow" "[]" split .
! => { "" "ERROR" ": Stack overflow" }
```

`harvest` (in [`sequences`][sequences]) drops the empty pieces:

```factor
"[ERROR]: Stack overflow" "[]" split harvest .
! => { "ERROR" ": Stack overflow" }
```

## Picking out a piece

Once a string is split into an array of pieces, `first`,
`second`, `third`, and `fourth` (in [`sequences`][sequences])
return the piece at that position:

```factor
"apple,bee,carrot,duck" "," split first .    ! => "apple"
"apple,bee,carrot,duck" "," split second .   ! => "bee"
"apple,bee,carrot,duck" "," split third .    ! => "carrot"
"apple,bee,carrot,duck" "," split fourth .   ! => "duck"
```

When you want all the leading pieces on the stack at once,
`first2` and `first3` unpack two or three of them in one step:

```factor
"apple,bee,carrot,duck" "," split first2 .s
! => "apple"
! => "bee"

"apple,bee,carrot,duck" "," split first3 .s
! => "apple"
! => "bee"
! => "carrot"
```

On a string itself, `first` returns the first **character** — a
code point — rather than a substring:

```factor
"hello" first .                         ! => 104   (CHAR: h)
```

## Trimming

`[ blank? ] trim` (from [`sequences`][sequences], with `blank?` from
the `ascii` vocabulary) removes leading and trailing whitespace:

```factor
"  Disk full \r\n" [ blank? ] trim .
! => "Disk full"
```

## Case conversion

`>lower` and `>upper` (from [`ascii`][ascii]) return a new string
with the case changed:

```factor
"WARNING" >lower .    ! => "warning"
"hello" >upper .      ! => "HELLO"
```

## Joining

Two `sequences` words assemble strings:

`surround` wraps a string with a prefix and a suffix:

```
surround ( seq pre post -- new-seq )
```

```factor
"warning" "(" ")" surround .    ! => "(warning)"
```

`glue` joins two strings with a separator between them:

```
glue ( s1 s2 sep -- s )
```

```factor
"Disk full" "(error)" " " glue .    ! => "Disk full (error)"
```

[splitting]: https://docs.factorcode.org/content/vocab-splitting.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[ascii]: https://docs.factorcode.org/content/vocab-ascii.html
