# Instructions append

## Words

Implement:

- `grep ( pattern flags files -- lines )`

`pattern` is the search string, `flags` is an array of zero or more of the
flag strings `"-n"`, `"-l"`, `"-i"`, `"-v"`, and `"-x"`, and `files` is an
array of one or more file names. Return the matching lines (with any requested
file-name and line-number prefixes) as an array of strings.

When the `-l` flag is given, return an array of the names of the files that
contain at least one match.

## Reading files

Read a file's lines with `file-lines`, passing an encoding:

```factor
USING: io.encodings.utf8 io.files ;

"iliad.txt" utf8 file-lines
! => { "Achilles sing, O Goddess! Peleus' son;" ... }
```

The three fixture files (`iliad.txt`, `midsummer-night.txt`, and
`paradise-lost.txt`) ship with the exercise in the working directory, so
reading them by name just works.
