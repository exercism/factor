# Instructions

You're back in the kitchen, refining the lasagna recipe from
[Leah's Luscious Lasagna][lasagna]. The tasks here ask you to juggle
several inputs at once, which is exactly when *locals* — Factor's
named bindings — earn their keep.

## 1. Determine the cooking status

Define `cooking-status` to take a timer reading off the stack and
return a status string.

- `0` → `"Lasagna is done."`
- `f` (the timer was never set) → `"You forgot to set the timer."`
- any other number → `"Not done, please wait."`

```factor
12 cooking-status .   ! => "Not done, please wait."
0 cooking-status .    ! => "Lasagna is done."
f cooking-status .    ! => "You forgot to set the timer."
```

## 2. Estimate the preparation time

Define `preparation-time` to take an array of layer names and an
average number of minutes per layer, and return the total preparation
time.

```factor
{ "sauce" "noodles" "sauce" "meat" "mozzarella" "noodles" } 3 preparation-time .
! => 18
```

## 3. Compute the noodles and sauce needed

Define `quantities` to take an array of layer names and return *two*
values: the grams of noodles needed (50 g per noodle layer) and the
litres of sauce needed (`1/5` litre per sauce layer).

```factor
{ "sauce" "noodles" "sauce" "meat" "mozzarella" "noodles" } quantities .s
! => 100
! => 2/5
```

## 4. Add the secret ingredient

Your friend sends a list of ingredients; the *last* item is their
secret. Define `add-secret-ingredient` to take their list and yours
and return your list with the secret appended.

```factor
{ "noodles" "sauce" "mozzarella" "kampot pepper" }
{ "noodles" "meat" "sauce" "mozzarella" }
add-secret-ingredient .
! => { "noodles" "meat" "sauce" "mozzarella" "kampot pepper" }
```

## 5. Scale the recipe

The cookbook recipe yields two portions. Define `scale-recipe` to
take a recipe (a hashtable from ingredient name to amount) and a
target number of portions, and return a new recipe scaled
appropriately.

```factor
H{ { "noodles" 200 } { "sauce" 1/2 } { "mozzarella" 1 } { "meat" 100 } }
4 scale-recipe .
! => H{ { "noodles" 400 } { "sauce" 1 } { "mozzarella" 2 } { "meat" 200 } }
```
