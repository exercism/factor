USING: exercism-tools io kernel sequences tools.test unicode word-search ;
IN: word-search.tests

"Should accept an initial game grid and a target search word" description
{ H{ { "clojure" f } } }
[
    {
        "jefblpepre"
    }
    {
        "clojure"
    }
    search
] unit-test

STOP-HERE

"Should locate one word written left to right" description
{ H{ { "clojure" { { 1 1 } { 7 1 } } } } }
[
    {
        "clojurermt"
    }
    {
        "clojure"
    }
    search
] unit-test

"Should locate the same word written left to right in a different position" description
{ H{ { "clojure" { { 3 1 } { 9 1 } } } } }
[
    {
        "mtclojurer"
    }
    {
        "clojure"
    }
    search
] unit-test

"Should locate a different left to right word" description
{ H{ { "coffee" { { 1 1 } { 6 1 } } } } }
[
    {
        "coffeelplx"
    }
    {
        "coffee"
    }
    search
] unit-test

"Should locate that different left to right word in a different position" description
{ H{ { "coffee" { { 2 1 } { 7 1 } } } } }
[
    {
        "xcoffeezlp"
    }
    {
        "coffee"
    }
    search
] unit-test

"Should locate a left to right word in two line grid" description
{ H{ { "clojure" { { 2 2 } { 8 2 } } } } }
[
    {
        "jefblpepre"
        "tclojurerm"
    }
    {
        "clojure"
    }
    search
] unit-test

"Should locate a left to right word in three line grid" description
{ H{ { "clojure" { { 1 3 } { 7 3 } } } } }
[
    {
        "camdcimgtc"
        "jefblpepre"
        "clojurermt"
    }
    {
        "clojure"
    }
    search
] unit-test

"Should locate a left to right word in ten line grid" description
{ H{ { "clojure" { { 1 10 } { 7 10 } } } } }
[
    {
        "jefblpepre"
        "camdcimgtc"
        "oivokprjsm"
        "pbwasqroua"
        "rixilelhrs"
        "wolcqlirpc"
        "screeaumgr"
        "alxhpburyi"
        "jalaycalmp"
        "clojurermt"
    }
    {
        "clojure"
    }
    search
] unit-test

"Should locate that left to right word in a different position in a ten line grid" description
{ H{ { "clojure" { { 1 9 } { 7 9 } } } } }
[
    {
        "jefblpepre"
        "camdcimgtc"
        "oivokprjsm"
        "pbwasqroua"
        "rixilelhrs"
        "wolcqlirpc"
        "screeaumgr"
        "alxhpburyi"
        "clojurermt"
        "jalaycalmp"
    }
    {
        "clojure"
    }
    search
] unit-test

"Should locate a different left to right word in a ten line grid" description
{ H{ { "fortran" { { 1 7 } { 7 7 } } } } }
[
    {
        "jefblpepre"
        "camdcimgtc"
        "oivokprjsm"
        "pbwasqroua"
        "rixilelhrs"
        "wolcqlirpc"
        "fortranftw"
        "alxhpburyi"
        "clojurermt"
        "jalaycalmp"
    }
    {
        "fortran"
    }
    search
] unit-test

"Should locate multiple words" description
{ H{ { "fortran" { { 1 7 } { 7 7 } } } { "clojure" { { 1 10 } { 7 10 } } } } }
[
    {
        "jefblpepre"
        "camdcimgtc"
        "oivokprjsm"
        "pbwasqroua"
        "rixilelhrs"
        "wolcqlirpc"
        "fortranftw"
        "alxhpburyi"
        "jalaycalmp"
        "clojurermt"
    }
    {
        "fortran"
        "clojure"
    }
    search
] unit-test

"Should locate a single word written right to left" description
{ H{ { "elixir" { { 6 1 } { 1 1 } } } } }
[
    {
        "rixilelhrs"
    }
    {
        "elixir"
    }
    search
] unit-test

"Should locate multiple words written in different horizontal directions" description
{ H{ { "elixir" { { 6 5 } { 1 5 } } } { "clojure" { { 1 10 } { 7 10 } } } } }
[
    {
        "jefblpepre"
        "camdcimgtc"
        "oivokprjsm"
        "pbwasqroua"
        "rixilelhrs"
        "wolcqlirpc"
        "screeaumgr"
        "alxhpburyi"
        "jalaycalmp"
        "clojurermt"
    }
    {
        "elixir"
        "clojure"
    }
    search
] unit-test

"Should locate words written top to bottom" description
{ H{ { "clojure" { { 1 10 } { 7 10 } } } { "elixir" { { 6 5 } { 1 5 } } } { "ecmascript" { { 10 1 } { 10 10 } } } } }
[
    {
        "jefblpepre"
        "camdcimgtc"
        "oivokprjsm"
        "pbwasqroua"
        "rixilelhrs"
        "wolcqlirpc"
        "screeaumgr"
        "alxhpburyi"
        "jalaycalmp"
        "clojurermt"
    }
    {
        "clojure"
        "elixir"
        "ecmascript"
    }
    search
] unit-test

"Should locate words written bottom to top" description
{ H{ { "clojure" { { 1 10 } { 7 10 } } } { "elixir" { { 6 5 } { 1 5 } } } { "ecmascript" { { 10 1 } { 10 10 } } } { "rust" { { 9 5 } { 9 2 } } } } }
[
    {
        "jefblpepre"
        "camdcimgtc"
        "oivokprjsm"
        "pbwasqroua"
        "rixilelhrs"
        "wolcqlirpc"
        "screeaumgr"
        "alxhpburyi"
        "jalaycalmp"
        "clojurermt"
    }
    {
        "clojure"
        "elixir"
        "ecmascript"
        "rust"
    }
    search
] unit-test

"Should locate words written top left to bottom right" description
{ H{ { "clojure" { { 1 10 } { 7 10 } } } { "elixir" { { 6 5 } { 1 5 } } } { "ecmascript" { { 10 1 } { 10 10 } } } { "rust" { { 9 5 } { 9 2 } } } { "java" { { 1 1 } { 4 4 } } } } }
[
    {
        "jefblpepre"
        "camdcimgtc"
        "oivokprjsm"
        "pbwasqroua"
        "rixilelhrs"
        "wolcqlirpc"
        "screeaumgr"
        "alxhpburyi"
        "jalaycalmp"
        "clojurermt"
    }
    {
        "clojure"
        "elixir"
        "ecmascript"
        "rust"
        "java"
    }
    search
] unit-test

"Should locate words written bottom right to top left" description
{ H{ { "clojure" { { 1 10 } { 7 10 } } } { "elixir" { { 6 5 } { 1 5 } } } { "ecmascript" { { 10 1 } { 10 10 } } } { "rust" { { 9 5 } { 9 2 } } } { "java" { { 1 1 } { 4 4 } } } { "lua" { { 8 9 } { 6 7 } } } } }
[
    {
        "jefblpepre"
        "camdcimgtc"
        "oivokprjsm"
        "pbwasqroua"
        "rixilelhrs"
        "wolcqlirpc"
        "screeaumgr"
        "alxhpburyi"
        "jalaycalmp"
        "clojurermt"
    }
    {
        "clojure"
        "elixir"
        "ecmascript"
        "rust"
        "java"
        "lua"
    }
    search
] unit-test

"Should locate words written bottom left to top right" description
{ H{ { "clojure" { { 1 10 } { 7 10 } } } { "elixir" { { 6 5 } { 1 5 } } } { "ecmascript" { { 10 1 } { 10 10 } } } { "rust" { { 9 5 } { 9 2 } } } { "java" { { 1 1 } { 4 4 } } } { "lua" { { 8 9 } { 6 7 } } } { "lisp" { { 3 6 } { 6 3 } } } } }
[
    {
        "jefblpepre"
        "camdcimgtc"
        "oivokprjsm"
        "pbwasqroua"
        "rixilelhrs"
        "wolcqlirpc"
        "screeaumgr"
        "alxhpburyi"
        "jalaycalmp"
        "clojurermt"
    }
    {
        "clojure"
        "elixir"
        "ecmascript"
        "rust"
        "java"
        "lua"
        "lisp"
    }
    search
] unit-test

"Should locate words written top right to bottom left" description
{ H{ { "clojure" { { 1 10 } { 7 10 } } } { "elixir" { { 6 5 } { 1 5 } } } { "ecmascript" { { 10 1 } { 10 10 } } } { "rust" { { 9 5 } { 9 2 } } } { "java" { { 1 1 } { 4 4 } } } { "lua" { { 8 9 } { 6 7 } } } { "lisp" { { 3 6 } { 6 3 } } } { "ruby" { { 8 6 } { 5 9 } } } } }
[
    {
        "jefblpepre"
        "camdcimgtc"
        "oivokprjsm"
        "pbwasqroua"
        "rixilelhrs"
        "wolcqlirpc"
        "screeaumgr"
        "alxhpburyi"
        "jalaycalmp"
        "clojurermt"
    }
    {
        "clojure"
        "elixir"
        "ecmascript"
        "rust"
        "java"
        "lua"
        "lisp"
        "ruby"
    }
    search
] unit-test

"Should fail to locate a word that is not in the puzzle" description
{ H{ { "clojure" { { 1 10 } { 7 10 } } } { "elixir" { { 6 5 } { 1 5 } } } { "ecmascript" { { 10 1 } { 10 10 } } } { "rust" { { 9 5 } { 9 2 } } } { "java" { { 1 1 } { 4 4 } } } { "lua" { { 8 9 } { 6 7 } } } { "lisp" { { 3 6 } { 6 3 } } } { "ruby" { { 8 6 } { 5 9 } } } { "haskell" f } } }
[
    {
        "jefblpepre"
        "camdcimgtc"
        "oivokprjsm"
        "pbwasqroua"
        "rixilelhrs"
        "wolcqlirpc"
        "screeaumgr"
        "alxhpburyi"
        "jalaycalmp"
        "clojurermt"
    }
    {
        "clojure"
        "elixir"
        "ecmascript"
        "rust"
        "java"
        "lua"
        "lisp"
        "ruby"
        "haskell"
    }
    search
] unit-test

"Should fail to locate words that are not on horizontal, vertical, or diagonal lines" description
{ H{ { "aef" f } { "ced" f } { "abf" f } { "cbd" f } } }
[
    {
        "abc"
        "def"
    }
    {
        "aef"
        "ced"
        "abf"
        "cbd"
    }
    search
] unit-test

"Should not concatenate different lines to find a horizontal word" description
{ H{ { "elixir" f } } }
[
    {
        "abceli"
        "xirdfg"
    }
    {
        "elixir"
    }
    search
] unit-test

"Should not wrap around horizontally to find a word" description
{ H{ { "lisp" f } } }
[
    {
        "silabcdefp"
    }
    {
        "lisp"
    }
    search
] unit-test

"Should not wrap around vertically to find a word" description
{ H{ { "rust" f } } }
[
    {
        "s"
        "u"
        "r"
        "a"
        "b"
        "c"
        "t"
    }
    {
        "rust"
    }
    search
] unit-test
