# Instructions

Josh is working on a new role-playing game and needs your help with
the player mechanics.

## 1. Define the `player` tuple

Define a tuple class `player` with four slots and default values:

| slot     | default |
| -------- | ------- |
| `name`   | `f`     |
| `level`  | `0`     |
| `health` | `100`   |
| `mana`   | `f`     |

Once defined, you can build a player as a literal:

```factor
T{ player { name "Merlin" } { level 5 } } .
! => T{ player { name "Merlin" } { level 5 } }
```

## 2. Introduce the player

Define `introduce` to return the player's name. Stealthy players hide
their name (`name` is `f`) and should be introduced as
`"Mighty Magician"`.

```factor
T{ player { name "Merlin" } } introduce .
! => "Merlin"

T{ player { health 8 } } introduce .
! => "Mighty Magician"
```

## 3. Revive a fallen player

Define `revive` to return a *new* player with `health` set to 100
and `mana` set to 100, but only if the player's `health` is `0`. If
the player is still alive, return `f`.

```factor
T{ player { name "Merlin" } { health 0 } } revive .
! => T{ player { name "Merlin" } { health 100 } { mana 100 } }

T{ player { health 50 } } revive .
! => f
```

## 4. Take damage

Define `take-damage` to return a *new* player whose `health` has been
reduced by the given amount, never falling below `0`.

```factor
T{ player { health 100 } } 30 take-damage .
! => T{ player { health 70 } }

T{ player { health 5 } } 30 take-damage .
! => T{ player { health 0 } }
```
