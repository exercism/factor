# Instructions append

## Words

Define a `school` tuple to hold the roster — how you store the
students inside it is up to you — then implement the words below.

- `<school> ( -- school )` — construct an empty school.
- `add-student ( school name grade -- ? )` — add `name` to
  `grade`. Return `t` on success, or `f` if `name` has already
  been added (to this or any other grade), in which case the
  roster is left unchanged.
- `roster ( school -- names )` — all students, sorted by grade
  and then alphabetically by name.
- `grade ( school n -- names )` — the students in grade `n`,
  sorted alphabetically by name.
