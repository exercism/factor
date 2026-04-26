# Instructions

It's Valentine's Day. Your partner has a few activity ideas and is
asking you to rate each one — `yes`, `no`, or `maybe`.

Activities are represented as 2-element arrays `{ tag value }`,
where `tag` is one of `board-game`, `chill`, `movie`, `restaurant`,
or `walk`.

| activity                  | shape                       |
| ------------------------- | --------------------------- |
| Play a board game         | `{ board-game f }`          |
| Chill out                 | `{ chill f }`               |
| Watch a movie of `genre`  | `{ movie genre }`           |
| Eat at a `cuisine` place  | `{ restaurant cuisine }`    |
| Walk `km` kilometres      | `{ walk km }`               |

The genre is one of `crime`, `horror`, `romance`, `thriller`. The
cuisine is `korean` or `turkish`.

## 1. Rate the cuisine

Define `rate-restaurant` to take a cuisine off the stack and return
your approval:

- `korean` → `yes`
- `turkish` → `maybe`

```factor
korean rate-restaurant .   ! => yes
turkish rate-restaurant .  ! => maybe
```

## 2. Rate the movie genre

Define `rate-movie` to take a genre and return:

- `romance` → `yes`
- anything else → `no`

```factor
romance rate-movie .   ! => yes
horror rate-movie .    ! => no
```

## 3. Rate the walk

Define `rate-walk` to take a number of kilometres and return:

- more than `11` → `yes`
- more than `6`, up to `11` → `maybe`
- otherwise → `no`

```factor
12 rate-walk .   ! => yes
8 rate-walk .    ! => maybe
3 rate-walk .    ! => no
```

## 4. Rate the activity

Define `rate-activity` to take a `{ tag value }` activity off the
stack and return your approval. Reuse the helpers above:

- `board-game`, `chill` → always `no`
- `movie` → defer to `rate-movie`
- `restaurant` → defer to `rate-restaurant`
- `walk` → defer to `rate-walk`

```factor
{ restaurant turkish } rate-activity .   ! => maybe
{ movie horror } rate-activity .         ! => no
{ walk 12 } rate-activity .              ! => yes
{ board-game f } rate-activity .         ! => no
```

## 5. Tally the approvals

Define `approval-counts` to take a list of activities and return a
3-element array `{ yes-count maybe-count no-count }` of how many
were rated each way.

```factor
{ { restaurant korean } { restaurant turkish } { walk 3 } { movie romance } }
approval-counts .
! => { 2 1 1 }
```
