# About

Hash-sets implement the [`sets`][sets] protocol with hashing
under the hood, giving O(1) average insert, lookup, and delete.
They're mutable in place, which makes them ideal for the
*visited set* pattern in graph traversals.

```factor
USING: hash-sets kernel sets ;

HS{ } clone                   ! fresh empty mutable set
"NS-1024" over adjoin         ! insert (no-op if already present)
"NS-1024" over in? .          ! => t  (membership test)
"WB-203" over adjoin
over cardinality .            ! => 2
"NS-1024" over delete         ! remove
over cardinality .            ! => 1
```

| word          | effect                                    |
|---------------|-------------------------------------------|
| `HS{ }`       | empty hash-set literal (shared — `clone` it!) |
| `adjoin`      | `( elt set -- )` — destructive insert     |
| `in?`         | `( elt set -- ? )` — membership           |
| `delete`      | `( elt set -- )` — destructive remove     |
| `cardinality` | `( set -- n )` — number of elements       |
| `members`     | `( set -- seq )` — enumerate as sequence  |
| `union`       | `( set1 set2 -- set )`                    |
| `intersect`   | `( set1 set2 -- set )`                    |
| `diff`        | `( set1 set2 -- set )`                    |
| `set-like`    | `( set exemplar -- set' )` — coerce `set` to the class of `exemplar` |

A subtle point about `in?` versus `member?` (from
`sequences`): both test membership, but `member?` does a
linear scan over a sequence, while `in?` dispatches to whatever
the set type's protocol method is — for `HS{ }`, that's a
hash lookup. Use `in?` once your "visited" container has more
than a handful of entries.

## Pairs nicely with hashtables

`HS{ }` for "is X visited?" pairs naturally with `H{ }` for
"who are X's neighbours?". A textbook DFS is just:

```factor
visited adjoin
stack push
[ stack empty? ] [
    stack pop dup neighbours-quot call [
        dup visited in? [ drop ] [
            [ visited adjoin ] [ stack push ] bi
        ] if
    ] each
] until
```

The visited set deduplicates work; the stack threads frontier
nodes (LIFO via `push`/`pop`); the neighbours map (a hashtable)
supplies the graph. Order of visitation doesn't matter for a
reachability question, which is why a vector-as-stack is enough
— a real BFS over the same shape swaps the vector for a
[`<dlist>`][deques] and dequeues from the front instead.

[deques]: https://docs.factorcode.org/content/vocab-deques.html

[sets]: https://docs.factorcode.org/content/vocab-sets.html
