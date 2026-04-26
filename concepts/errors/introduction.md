# Introduction

Factor's error system has three pieces: `throw` (in
[`kernel`][kernel]) raises an error, `recover` (in
[`continuations`][continuations]) catches one, and `ERROR:` defines
a tuple-typed error class.

```factor
"file not found" throw         ! raises a string as the error

[ "boom" throw ] [ drop "caught" ] recover .
! => "caught"
```

`recover ( try recovery -- )` runs the *try* quotation; if it
throws, the error is pushed and the *recovery* quotation runs.

`ERROR:` declares both the class *and* a constructor word that
throws a fresh instance:

```factor
ERROR: not-found path ;

"/missing" not-found
! throws T{ not-found { path "/missing" } }
```

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
[continuations]: https://docs.factorcode.org/content/vocab-continuations.html
