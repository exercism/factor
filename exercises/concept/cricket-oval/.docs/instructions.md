# Instructions

The groundskeeper at a suburban cricket oval wants some help with the
numbers: how much rope the boundary needs, how far and in which
direction a shot went, and how far the ball rolls before the fielders
get to it.

Every distance is in metres and every speed in metres per second.
Positions on the field are measured from the middle of the pitch: `x`
metres straight down the ground, and `y` metres across it, with left
positive and right negative.

## 1. Rope for the boundary

The boundary is a circle round the middle of the pitch. Define
`boundary-length`, taking the radius and returning the length of rope
it takes, which is 2 × π × the radius.

```factor
70.0 boundary-length .
! => 439.822971502571
```

## 2. How far from the pitch?

Define `distance-from-pitch`, taking a fielder's `x` and `y` and
returning how far they stand from the middle of the pitch: the square
root of x² + y².

```factor
30.0 40.0 distance-from-pitch .
! => 50.0
```

## 3. Which way did it go?

Define `shot-angle`, taking the `x` and `y` of where a shot landed and
returning its direction in **degrees**: 0 is straight down the ground,
90 is square on the left, -90 square on the right, and 180 straight
back past the keeper.

```factor
50.0 50.0 shot-angle .
! => 45.0
```

## 4. How far did it carry?

A ball hit at `speed`, rising at `angle` **degrees**, carries
speed² × sin(2 × angle) ÷ 9.8 metres before it first lands. Define
`carry`, taking the speed and the angle and returning that distance.

```factor
30.0 45.0 carry .
! => 91.83673469387755
```

## 5. Slowing on the grass

Rolling along the outfield, a ball loses speed: after `metres` its
speed is speed × e^(−0.02 × metres). Define `speed-after`, taking the
starting speed and the metres rolled and returning the speed it has
left.

```factor
30.0 50.0 speed-after .
! => 11.03638323514327
```

## 6. Where will it stop being worth chasing?

Turn task 5 round. Define `metres-until`, taking the speed a ball
starts rolling at and a slower `target` speed, and returning how many
metres it rolls before it is down to the target:
log(speed ÷ target) ÷ 0.02, where log is the natural
logarithm.

```factor
30.0 15.0 metres-until .
! => 34.657359027997266
```
