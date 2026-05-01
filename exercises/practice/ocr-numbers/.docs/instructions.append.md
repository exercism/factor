# Instructions append

## Words

`convert ( rows -- str )` takes the grid as an array of strings,
one string per row, and returns the recognised digits as a single
string. Multiple rows of cells are joined in the output with
commas (`,`) per the canonical instructions.

## Errors

Throw one of these strings (verbatim) for malformed input:

- `"Number of input lines is not a multiple of four"`
- `"Number of input columns is not a multiple of three"`
