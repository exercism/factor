# Instructions append

## Words

- `can-chain? ( dominoes -- ? )` — return `t` if the dominoes can
  be arranged in a closed chain.

Each domino is stored as a single byte, with the left half in the
high [nibble] and the right half in the low [nibble]. For example,
stones `[2|1]`, `[2|3]`, and `[1|3]` are represented as the byte
array `{ 0x21 0x23 0x13 }`.

[nibble]: https://en.wikipedia.org/wiki/Nibble
