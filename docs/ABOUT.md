<!-- this is a stub, copied from factorcode.org. I should really put something better here... and I will! soon -->

Factor combines [powerful language features](http://concatenative.org/wiki/view/Factor/Features/The%20language) with a [full-featured library](http://docs.factorcode.org/content/article-vocab-index.html). The implementation is [fully compiled](http://concatenative.org/wiki/view/Factor/Optimizing%20compiler) for performance, while still supporting [interactive development](http://concatenative.org/wiki/view/Factor/Interactive development). Factor applications are portable between all common platforms. Factor can [deploy stand-alone applications](http://concatenative.org/wiki/view/Factor/Deployment) on all platforms. Full source code for the Factor project is available under a [BSD license](http://factorcode.org/license.txt).

#### Glossary of Factor terms

* **Word** Essentially a function. All words must have a declared stack effect.
* **Vocabulary** A collection of words, like a module or library in other languages.
* **Stack** A last-in-first-out data structure used for all operations. It is the primary way of passing data between functions. It is, however, an implementation detail; Factor could be mostly implemented using term rewriting.
* **Program** a series of **words** that manipulate a **stack** of references to dynamically-typed values. This gives the language a powerful foundation which allows many abstractions and paradigms to be built on top.