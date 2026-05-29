# Instructions append

## Factor specifics

Implement the word:

```factor
food-chain ( start end -- lines )
```

`start` and `end` are verse numbers (1 for the fly, up to 8 for the
horse), inclusive. Return the requested verses as a sequence of
strings — one string per line of the song.

When more than one verse is requested, separate consecutive verses
with a single empty string (`""`) so that the verses are rendered with
a blank line between them. There is no trailing blank line after the
last verse.

```factor
1 2 food-chain .
! => {
!        "I know an old lady who swallowed a fly."
!        "I don't know why she swallowed the fly. Perhaps she'll die."
!        ""
!        "I know an old lady who swallowed a spider."
!        "It wriggled and jiggled and tickled inside her."
!        "She swallowed the spider to catch the fly."
!        "I don't know why she swallowed the fly. Perhaps she'll die."
!    }
```
