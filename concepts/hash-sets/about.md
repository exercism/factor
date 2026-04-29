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

A subtle point about `in?` versus `member?` (from
`sequences`): both test membership, but `member?` does a
linear scan over a sequence, while `in?` dispatches to whatever
the set type's protocol method is — for `HS{ }`, that's a
hash lookup. Use `in?` once your "visited" container has more
than a handful of entries.

## Pairs nicely with hashtables

`HS{ }` for "is X visited?" pairs naturally with `H{ }` for
"who are X's neighbours?". A textbook BFS is just:

```factor
visited adjoin
queue push
[ queue empty? not ] [
    queue pop dup neighbours-quot call [
        dup visited in? [ drop ] [
            [ visited adjoin ] [ queue push ] bi
        ] if
    ] each
] while
```

The visited set deduplicates work; the queue threads frontier
nodes; the neighbours map (a hashtable) supplies the graph.

[sets]: https://docs.factorcode.org/content/vocab-sets.html
