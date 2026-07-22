# Instructions append

## Words

Define a `game` tuple and a constructor `<game> ( -- game )` that returns a new
game with no rolls.

Provide these words operating on a game:

- `roll ( pins game -- )` — record that `pins` pins were knocked down. Throw an
  error when the roll is invalid:
  - `"Negative roll is invalid"` for a negative number of pins.
  - `"Cannot roll after game is over"` once all ten frames (and any fill balls)
    have been rolled.
  - `"Pin count exceeds pins on the lane"` when more pins are knocked down than
    are standing.
- `score ( game -- n )` — the total score for the game. Throw
  `"Score cannot be taken until the end of the game"` when the game is not yet
  complete.

Note that `roll` shadows the `roll` shuffle word from the `kernel` vocabulary.
The test suite disambiguates with `FROM: bowling => roll ;`.
