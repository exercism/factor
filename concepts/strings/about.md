# About

A string in Factor is a sequence of characters and shares the full
`sequences` protocol — `length`, `nth`, `head`, `tail`, `map`,
`filter`, and so on — alongside its dedicated vocabularies.

```factor
"hello"  length .       ! => 5
"hello"  reverse .      ! => "olleh"
"abcdef" 3 head .       ! => "abc"
```

The string-specific words live mostly in `splitting`, `ascii`, and
`unicode`:

| word         | vocab         | what it does                          |
|--------------|---------------|---------------------------------------|
| `split1`     | `splitting`   | cut on the first occurrence           |
| `split`      | `splitting`   | cut on any character in a set         |
| `harvest`    | `sequences`   | drop empty pieces from a split result |
| `replace`    | `sequences`   | substitute a substring                |
| `surround`   | `sequences`   | wrap with a prefix and suffix         |
| `glue`       | `sequences`   | join two strings with a separator     |
| `join`       | `sequences`   | join an array of strings with a separator |
| `>lower`     | `ascii`       | lowercase (ASCII)                     |
| `>upper`     | `ascii`       | uppercase (ASCII)                     |
| `[ blank? ] trim` | `sequences` | strip leading/trailing whitespace |
| `first`, `second`, `first2`, `first3` | `sequences` | unpack the leading element(s) |
| `>string`    | `strings`     | turn a sequence of chars into a string |

For numeric ↔ string round-tripping, [`math.parser`][math.parser]
provides `number>string` and `string>number`. For format-string
output, [`formatting`][formatting] provides `sprintf` and friends.

For Unicode-aware case conversion or character classification, use
the corresponding words in `unicode`.

[math.parser]: https://docs.factorcode.org/content/vocab-math.parser.html
[formatting]: https://docs.factorcode.org/content/vocab-formatting.html
