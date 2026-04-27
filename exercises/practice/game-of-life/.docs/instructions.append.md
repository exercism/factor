# Instructions append

## Words

- `tick ( matrix cols -- matrix' )` — advance the grid by one
  generation and return the new grid.

Each row of the grid is represented as a 64-bit integer; `cols` is
the number of columns (at most 64). For example,

```
    0 1 0
    1 0 0
    1 1 0
```

is represented as

```
0b010
0b100
0b110
```
