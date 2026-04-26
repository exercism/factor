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

| word         | vocab       | what it does                    |
|--------------|-------------|---------------------------------|
| `split1`     | `splitting` | cut on the first occurrence     |
| `split`      | `splitting` | cut on any character in a set   |
| `replace`    | `sequences` | substitute a substring          |
| `>lower`     | `ascii`     | lowercase (ASCII)               |
| `>upper`     | `ascii`     | uppercase (ASCII)               |
| `[ blank? ] trim` | `sequences` | strip leading/trailing whitespace |

For Unicode-aware case conversion or character classification, use
the corresponding words in `unicode`.
