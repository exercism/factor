# About

A string in Factor is a sequence of characters and shares the full
[`sequences` protocol][sequence-protocol] — `length`, `nth`, `head`,
`tail`, `map`, `filter`, and so on — alongside its dedicated
vocabularies.

```factor
"hello"  length .       ! => 5
"hello"  reverse .      ! => "olleh"
"abcdef" 3 head .       ! => "abc"
```

The string-specific words live mostly in [`splitting`][splitting],
[`ascii`][ascii], and [`unicode`][unicode]:

| word         | vocab         | what it does                          |
|--------------|---------------|---------------------------------------|
| `split1`     | [`splitting`][splitting]   | cut on the first occurrence           |
| `split`      | [`splitting`][splitting]   | cut on any character in a set         |
| `harvest`    | [`sequences`][sequences]   | drop empty pieces from a split result |
| `replace`    | [`sequences`][sequences]   | substitute a substring                |
| `surround`   | [`sequences`][sequences]   | wrap with a prefix and suffix         |
| `glue`       | [`sequences`][sequences]   | join two strings with a separator     |
| `join`       | [`sequences`][sequences]   | join an array of strings with a separator |
| `>lower`     | [`ascii`][ascii]       | lowercase (ASCII)                     |
| `>upper`     | [`ascii`][ascii]       | uppercase (ASCII)                     |
| `[ blank? ] trim` | [`sequences`][sequences] | strip leading/trailing whitespace |
| `first`, `second`, `third`, `fourth` | [`sequences`][sequences] | the leading slot |
| `first2`, `first3`         | [`sequences`][sequences]   | unpack two or three leading slots |
| `>string`    | [`strings`][strings]     | turn a sequence of chars into a string |
| `1string`    | [`strings`][strings]     | wrap a single character into a one-character string |
| `CHAR: x`    | parser        | a single-character literal (e.g. `CHAR: A` → `65`) |

For numeric ↔ string round-tripping, [`math.parser`][math.parser]
provides `number>string` and `string>number`. For format-string
output, [`formatting`][formatting] provides `sprintf` and friends.

For Unicode-aware case conversion or character classification, use
the corresponding words in [`unicode`][unicode].

[math.parser]: https://docs.factorcode.org/content/vocab-math.parser.html
[formatting]: https://docs.factorcode.org/content/vocab-formatting.html
[sequence-protocol]: https://docs.factorcode.org/content/article-sequence-protocol.html
[splitting]: https://docs.factorcode.org/content/vocab-splitting.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[ascii]: https://docs.factorcode.org/content/vocab-ascii.html
[strings]: https://docs.factorcode.org/content/vocab-strings.html
[unicode]: https://docs.factorcode.org/content/vocab-unicode.html
