# Hints

## General

- Each file starts with a `USING:` line listing the vocabularies
  it borrows from, and an `IN:` line declaring its own
  vocabulary. The name after `IN:` must match the file's path
  under the exercise root: `bosuns-briefing.helpers` for
  `helpers/helpers.factor`, `bosuns-briefing` for the main file.
- Whenever you call a word from another vocabulary, add that
  vocabulary to the `USING:` line.

## 1. `greeting`

- `greeting` takes nothing and returns one literal string. The
  body is just that string literal.

## 2. `crew-line`

- `prepend` (in `sequences`) takes `( seq1 seq2 -- newseq )` and
  returns `seq2` followed by `seq1`. So
  `"Lopez" "  - " prepend` produces `"  - Lopez"`.

## 3. `closing`

- Same shape as `greeting`.

## 4. `roster`

- `[ crew-line ] map` (from `sequences`) applies `crew-line` to
  each element of the input array, returning an array of formatted
  strings.
- `"\n" join` (from `splitting`) concatenates an array of strings,
  inserting `"\n"` between each pair.

## 5. `briefing`

- The result is three strings joined by `"\n"`: the greeting, the
  roster of the input names, and the closing.
- `3array` (from `arrays`) packages the three values into a
  single array, ready for `"\n" join`.
- Locals make this readable:
  ```factor
  :: briefing ( names -- str )
      greeting names roster closing 3array "\n" join ;
  ```
