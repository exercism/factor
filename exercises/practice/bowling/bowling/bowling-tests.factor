USING: bowling exercism-tools io kernel locals sequences tools.test unicode ;
IN: bowling.tests
FROM: bowling => roll ;

"should be able to score a game with all zeros" description
{ 0 } [
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 } [ g roll ] each
      g score
    ]
] unit-test

STOP-HERE

"should be able to score a game with no strikes or spares" description
{ 90 } [
    [let <game> :> g
      { 3 6 3 6 3 6 3 6 3 6 3 6 3 6 3 6 3 6 3 6 } [ g roll ] each
      g score
    ]
] unit-test

"a spare followed by zeros is worth ten points" description
{ 10 } [
    [let <game> :> g
      { 6 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 } [ g roll ] each
      g score
    ]
] unit-test

"points scored in the roll after a spare are counted twice" description
{ 16 } [
    [let <game> :> g
      { 6 4 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 } [ g roll ] each
      g score
    ]
] unit-test

"consecutive spares each get a one roll bonus" description
{ 31 } [
    [let <game> :> g
      { 5 5 3 7 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 } [ g roll ] each
      g score
    ]
] unit-test

"a spare in the last frame gets a one roll bonus that is counted once" description
{ 17 } [
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 3 7 } [ g roll ] each
      g score
    ]
] unit-test

"a strike earns ten points in a frame with a single roll" description
{ 10 } [
    [let <game> :> g
      { 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 } [ g roll ] each
      g score
    ]
] unit-test

"points scored in the two rolls after a strike are counted twice as a bonus" description
{ 26 } [
    [let <game> :> g
      { 10 5 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 } [ g roll ] each
      g score
    ]
] unit-test

"consecutive strikes each get the two roll bonus" description
{ 81 } [
    [let <game> :> g
      { 10 10 10 5 3 0 0 0 0 0 0 0 0 0 0 0 0 } [ g roll ] each
      g score
    ]
] unit-test

"a strike in the last frame gets a two roll bonus that is counted once" description
{ 18 } [
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 7 1 } [ g roll ] each
      g score
    ]
] unit-test

"rolling a spare with the two roll bonus does not get a bonus roll" description
{ 20 } [
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 7 3 } [ g roll ] each
      g score
    ]
] unit-test

"strikes with the two roll bonus do not get bonus rolls" description
{ 30 } [
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 10 } [ g roll ] each
      g score
    ]
] unit-test

"last two strikes followed by only last bonus with non strike points" description
{ 31 } [
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 0 1 } [ g roll ] each
      g score
    ]
] unit-test

"a strike with the one roll bonus after a spare in the last frame does not get a bonus" description
{ 20 } [
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 3 10 } [ g roll ] each
      g score
    ]
] unit-test

"all strikes is a perfect game" description
{ 300 } [
    [let <game> :> g
      { 10 10 10 10 10 10 10 10 10 10 10 10 } [ g roll ] each
      g score
    ]
] unit-test

"rolls cannot score negative points" description
[
    [let <game> :> g
      -1 g roll
    ]
] [ "Negative roll is invalid" = ] must-fail-with

"a roll cannot score more than 10 points" description
[
    [let <game> :> g
      11 g roll
    ]
] [ "Pin count exceeds pins on the lane" = ] must-fail-with

"two rolls in a frame cannot score more than 10 points" description
[
    [let <game> :> g
      { 5 } [ g roll ] each
      6 g roll
    ]
] [ "Pin count exceeds pins on the lane" = ] must-fail-with

"bonus roll after a strike in the last frame cannot score more than 10 points" description
[
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 } [ g roll ] each
      11 g roll
    ]
] [ "Pin count exceeds pins on the lane" = ] must-fail-with

"two bonus rolls after a strike in the last frame cannot score more than 10 points" description
[
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 5 } [ g roll ] each
      6 g roll
    ]
] [ "Pin count exceeds pins on the lane" = ] must-fail-with

"two bonus rolls after a strike in the last frame can score more than 10 points if one is a strike" description
{ 26 } [
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 6 } [ g roll ] each
      g score
    ]
] unit-test

"the second bonus rolls after a strike in the last frame cannot be a strike if the first one is not a strike" description
[
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 6 } [ g roll ] each
      10 g roll
    ]
] [ "Pin count exceeds pins on the lane" = ] must-fail-with

"second bonus roll after a strike in the last frame cannot score more than 10 points" description
[
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 } [ g roll ] each
      11 g roll
    ]
] [ "Pin count exceeds pins on the lane" = ] must-fail-with

"an unstarted game cannot be scored" description
[
    [let <game> :> g
      g score
    ]
] [ "Score cannot be taken until the end of the game" = ] must-fail-with

"an incomplete game cannot be scored" description
[
    [let <game> :> g
      { 0 0 } [ g roll ] each
      g score
    ]
] [ "Score cannot be taken until the end of the game" = ] must-fail-with

"cannot roll if game already has ten frames" description
[
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 } [ g roll ] each
      0 g roll
    ]
] [ "Cannot roll after game is over" = ] must-fail-with

"bonus rolls for a strike in the last frame must be rolled before score can be calculated" description
[
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 } [ g roll ] each
      g score
    ]
] [ "Score cannot be taken until the end of the game" = ] must-fail-with

"both bonus rolls for a strike in the last frame must be rolled before score can be calculated" description
[
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 } [ g roll ] each
      g score
    ]
] [ "Score cannot be taken until the end of the game" = ] must-fail-with

"bonus roll for a spare in the last frame must be rolled before score can be calculated" description
[
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 3 } [ g roll ] each
      g score
    ]
] [ "Score cannot be taken until the end of the game" = ] must-fail-with

"cannot roll after bonus roll for spare" description
[
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 3 2 } [ g roll ] each
      2 g roll
    ]
] [ "Cannot roll after game is over" = ] must-fail-with

"cannot roll after bonus rolls for strike" description
[
    [let <game> :> g
      { 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 3 2 } [ g roll ] each
      2 g roll
    ]
] [ "Cannot roll after game is over" = ] must-fail-with
