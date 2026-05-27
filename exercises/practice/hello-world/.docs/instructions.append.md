# Instructions append

## Implementation notes

A Factor program is built from *words*, grouped into
*vocabularies*.

Factor loads a *vocabulary* from a directory of the same name, so the `hello-world` vocabulary is the file `hello-world.factor` inside a `hello-world/` directory.

`: say-hello ( -- str ) … ;` defines the word `say-hello`.
The part in parentheses is its *stack effect*: nothing to the left of `--` means it takes no input, and `str` to the right means it leaves one value (the name is only documentation, not a type).
Everything between the stack effect and the closing `;` is the body — the code that runs when the word is called.

The test suite calls `say-hello` and checks the value it leaves on the stack.
Change the body so the word leaves `"Hello, World!"` instead, then run the tests.
