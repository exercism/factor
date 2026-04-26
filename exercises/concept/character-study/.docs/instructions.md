# Instructions

Lewis, a young Lisp Alien, needs to get some work done on their
Human alphabets project and asks if you can help them program some
words they will need.

## 1. Compare two characters

Define `compare-chars` to take two characters and return the symbol
`less`, `greater`, or `equal` depending on whether the first is
less than, greater than, or equal to the second. Compare in a
case-sensitive manner.

```factor
CHAR: A CHAR: B compare-chars .   ! => less
CHAR: B CHAR: A compare-chars .   ! => greater
CHAR: A CHAR: A compare-chars .   ! => equal
CHAR: A CHAR: a compare-chars .   ! => less
```

## 2. Determine the size of a character

Lewis needs to know whether a character is "big" (uppercase),
"small" (lowercase), or has no size. Define `size-of-char` to
return `big`, `small`, or `no-size`.

```factor
CHAR: A size-of-char .       ! => big
CHAR: a size-of-char .       ! => small
CHAR: 5 size-of-char .       ! => no-size
CHAR: space size-of-char .   ! => no-size
```

## 3. Change the size of a character

Lewis sometimes needs to flip a character to a different size.
Define `change-size-of-char` to take a character and a desired
size (`big` or `small`) and return the corresponding-case
character.

```factor
CHAR: a big change-size-of-char .     ! => 65   (CHAR: A)
CHAR: A small change-size-of-char .   ! => 97   (CHAR: a)
```

## 4. Determine the type of a character

Lewis also needs to know what *kind* of character it is. Define
`type-of-char` to return:

- `alpha` for any letter (upper or lower)
- `numeric` for a decimal digit
- `space` for the space character
- `newline` for the newline character
- `unknown` otherwise

```factor
CHAR: A type-of-char .       ! => alpha
CHAR: 5 type-of-char .       ! => numeric
CHAR: space type-of-char .   ! => space
CHAR: \n type-of-char .      ! => newline
CHAR: ! type-of-char .       ! => unknown
```
