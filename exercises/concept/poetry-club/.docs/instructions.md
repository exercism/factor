# Instructions

The local poetry club is starting a new season. Poets join the club,
and whenever two of them co-write a poem they become part of the same
*writing circle*. The club wants to keep track of who shares a circle
with whom, and you have been asked to write the words that manage it.

A disjoint set is the perfect fit: each poet is an atom, and a writing
circle is a group.

## 1. Open the club

Define `new-club`, taking a sequence of poets and returning a fresh
disjoint set with every poet registered. Each poet starts in a writing
circle of their own.

```factor
{ "Keats" "Byron" "Dickinson" } new-club
! => a disjoint set holding the three poets
```

## 2. Record a collaboration

Define `collaborate`, taking two poets and a club. It merges the two
poets' writing circles and returns the club, so collaborations can be
recorded one after another.

```factor
{ "Keats" "Byron" "Dickinson" } new-club
"Keats" "Byron" rot collaborate
! => the club, with Keats and Byron now in one circle
```

## 3. Find a poet's circle

Define `circle-of`, taking a poet and a club and returning the
representative of that poet's writing circle. Two poets who share a
circle always report the same representative.

```factor
{ "Keats" "Byron" "Dickinson" } new-club
"Dickinson" swap circle-of
! => "Dickinson"   (still in a circle of their own)
```

## 4. Share a circle?

Define `same-circle?`, taking two poets and a club and returning `t`
when both poets belong to the same writing circle and `f` otherwise.
Compare the poets' representatives rather than using a built-in
equivalence test.

```factor
{ "Keats" "Byron" "Dickinson" } new-club
"Keats" "Byron" rot collaborate
dup [ "Keats" "Byron" ] dip same-circle? .      ! => t
    [ "Keats" "Dickinson" ] dip same-circle? .  ! => f
```
