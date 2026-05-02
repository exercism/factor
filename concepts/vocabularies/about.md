# About

A vocabulary is the unit of organization in Factor: a named
collection of word definitions.

```factor
USING: kernel ;
IN: greetings.formal

: hello ( name -- str ) "Greetings, " prepend ;
```

## File and directory layout

Vocabulary names use `.` as a separator. The path follows the
dots:

| Vocabulary             | File                                       |
| ---                    | ---                                        |
| `greetings`            | `greetings/greetings.factor`               |
| `greetings.formal`     | `greetings/formal/formal.factor`           |
| `greetings.casual`     | `greetings/casual/casual.factor`           |

Factor's loader looks up vocabularies by walking the *vocab
roots* — the project root and the bundled basis library — until
it finds a directory whose name matches each path segment. The
final segment is repeated as the filename.

## `USING:` and `IN:`

`USING:` (alongside `USE:` for one vocab at a time) brings other
vocabularies into the current file's search path. `IN:` declares
which vocabulary the words defined in this file *belong to* —
their fully-qualified names start with that prefix.

```factor
USING: kernel sequences greetings.formal ;
IN: greetings

: greet-everyone ( names -- strs )
    [ hello ] map ;
```

Here `greet-everyone` is in `greetings`, calls `hello` from
`greetings.formal`, and `map` from `sequences`.

## Why split a solution across vocabs

Splitting code across vocabularies lets you:

- Group small helper words by responsibility, away from the
  high-level routine that composes them.
- Reuse the helpers from elsewhere without dragging in the main
  routine.
- Read each file as a single coherent layer of abstraction.

Factor's loader is fast and lazy enough that splitting *down*
into smaller vocabs is cheap; the convention on the standard
library is to factor aggressively.
