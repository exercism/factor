# Instructions

A naturalist is cataloguing the dragons that live around the
caldera. They share traits with one another — every dragon has
a name, colour, and age — but specialise in distinctive ways.
You'll build a small inheritance tree of dragon classes and a
single word that ages any descendant.

## 1. The dragon family

Define the whole inheritance tree of tuple classes up front (their
constructors come in the tasks that follow):

- `dragon` with slots `name`, `color`, `age`.
- `fire-dragon`, a subclass of `dragon`, adding a `flame-temp` slot.
- `ice-dragon`, another subclass of `dragon`, adding a `chill-temp`
  slot.
- `volcano-dragon`, a subclass of `fire-dragon`, adding a
  `lava-volume` slot.

Then give `dragon` a `<dragon>` constructor.

```factor
"Falkor" "white" 100 <dragon> name>> .   ! => "Falkor"
```

## 2. The fire breathers

Give `fire-dragon` a `<fire-dragon>` constructor.

```factor
"Smaug" "red" 500 1200 <fire-dragon> flame-temp>> .   ! => 1200
"Smaug" "red" 500 1200 <fire-dragon> dragon? .        ! => t
```

## 3. The ice breathers

Give `ice-dragon` a `<ice-dragon>` constructor.

```factor
"Frosty" "blue" 200 -40 <ice-dragon> chill-temp>> .   ! => -40
"Frosty" "blue" 200 -40 <ice-dragon> fire-dragon? .   ! => f   (siblings)
```

## 4. The volcano dwellers

Give `volcano-dragon` a `<volcano-dragon>` constructor.

```factor
"Vesuvius" "red" 1000 1500 99 <volcano-dragon> dragon? .       ! => t
"Vesuvius" "red" 1000 1500 99 <volcano-dragon> fire-dragon? .  ! => t
```

## 5. Aging any dragon

Define `age-dragon` to increment the `age` slot of any dragon
(or descendant) by one. Returns nothing.

```factor
"Falkor" "white" 100 <dragon> dup age-dragon age>> .   ! => 101
```

The same word should work on every descendant — that's the
whole point of the shared accessor.
