# Introduction

Most data in Factor lives in *sequences*. Arrays (`{ … }`), vectors
(`V{ … }`), and strings all share the same protocol from
[`sequences`][sequences].

```factor
{ 1 2 3 } length .    ! => 3
{ 1 2 3 } first .     ! => 1
{ 1 2 3 } last .      ! => 3
{ 1 2 3 4 5 } 3 head .! => { 1 2 3 }
```

Aggregations — `sum`, `count`, `any?`, `all?` — and predicates like
`empty?` and `member?` work uniformly across every sequence type.
Building new sequences without mutation: `prefix`, `suffix`,
`append`, `unclip`, `unclip-last`.

`>array`, `>vector`, and `>string` (in
[`arrays`][arrays] and the corresponding vocabularies) coerce
between sequence types when you need a particular concrete one
back from a generic operation.

[arrays]: https://docs.factorcode.org/content/vocab-arrays.html

[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
