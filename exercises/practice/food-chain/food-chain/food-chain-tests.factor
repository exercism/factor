USING: exercism-tools food-chain io kernel tools.test unicode ;
IN: food-chain.tests

"fly" description
{ { "I know an old lady who swallowed a fly." "I don't know why she swallowed the fly. Perhaps she'll die." } }
[ 1 1 food-chain ] unit-test

STOP-HERE

"spider" description
{ { "I know an old lady who swallowed a spider." "It wriggled and jiggled and tickled inside her." "She swallowed the spider to catch the fly." "I don't know why she swallowed the fly. Perhaps she'll die." } }
[ 2 2 food-chain ] unit-test

"bird" description
{ { "I know an old lady who swallowed a bird." "How absurd to swallow a bird!" "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her." "She swallowed the spider to catch the fly." "I don't know why she swallowed the fly. Perhaps she'll die." } }
[ 3 3 food-chain ] unit-test

"cat" description
{ { "I know an old lady who swallowed a cat." "Imagine that, to swallow a cat!" "She swallowed the cat to catch the bird." "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her." "She swallowed the spider to catch the fly." "I don't know why she swallowed the fly. Perhaps she'll die." } }
[ 4 4 food-chain ] unit-test

"dog" description
{ { "I know an old lady who swallowed a dog." "What a hog, to swallow a dog!" "She swallowed the dog to catch the cat." "She swallowed the cat to catch the bird." "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her." "She swallowed the spider to catch the fly." "I don't know why she swallowed the fly. Perhaps she'll die." } }
[ 5 5 food-chain ] unit-test

"goat" description
{ { "I know an old lady who swallowed a goat." "Just opened her throat and swallowed a goat!" "She swallowed the goat to catch the dog." "She swallowed the dog to catch the cat." "She swallowed the cat to catch the bird." "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her." "She swallowed the spider to catch the fly." "I don't know why she swallowed the fly. Perhaps she'll die." } }
[ 6 6 food-chain ] unit-test

"cow" description
{ { "I know an old lady who swallowed a cow." "I don't know how she swallowed a cow!" "She swallowed the cow to catch the goat." "She swallowed the goat to catch the dog." "She swallowed the dog to catch the cat." "She swallowed the cat to catch the bird." "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her." "She swallowed the spider to catch the fly." "I don't know why she swallowed the fly. Perhaps she'll die." } }
[ 7 7 food-chain ] unit-test

"horse" description
{ { "I know an old lady who swallowed a horse." "She's dead, of course!" } }
[ 8 8 food-chain ] unit-test

"multiple verses" description
{ { "I know an old lady who swallowed a fly." "I don't know why she swallowed the fly. Perhaps she'll die." "" "I know an old lady who swallowed a spider." "It wriggled and jiggled and tickled inside her." "She swallowed the spider to catch the fly." "I don't know why she swallowed the fly. Perhaps she'll die." "" "I know an old lady who swallowed a bird." "How absurd to swallow a bird!" "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her." "She swallowed the spider to catch the fly." "I don't know why she swallowed the fly. Perhaps she'll die." } }
[ 1 3 food-chain ] unit-test

"full song" description
{ { "I know an old lady who swallowed a fly." "I don't know why she swallowed the fly. Perhaps she'll die." "" "I know an old lady who swallowed a spider." "It wriggled and jiggled and tickled inside her." "She swallowed the spider to catch the fly." "I don't know why she swallowed the fly. Perhaps she'll die." "" "I know an old lady who swallowed a bird." "How absurd to swallow a bird!" "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her." "She swallowed the spider to catch the fly." "I don't know why she swallowed the fly. Perhaps she'll die." "" "I know an old lady who swallowed a cat." "Imagine that, to swallow a cat!" "She swallowed the cat to catch the bird." "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her." "She swallowed the spider to catch the fly." "I don't know why she swallowed the fly. Perhaps she'll die." "" "I know an old lady who swallowed a dog." "What a hog, to swallow a dog!" "She swallowed the dog to catch the cat." "She swallowed the cat to catch the bird." "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her." "She swallowed the spider to catch the fly." "I don't know why she swallowed the fly. Perhaps she'll die." "" "I know an old lady who swallowed a goat." "Just opened her throat and swallowed a goat!" "She swallowed the goat to catch the dog." "She swallowed the dog to catch the cat." "She swallowed the cat to catch the bird." "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her." "She swallowed the spider to catch the fly." "I don't know why she swallowed the fly. Perhaps she'll die." "" "I know an old lady who swallowed a cow." "I don't know how she swallowed a cow!" "She swallowed the cow to catch the goat." "She swallowed the goat to catch the dog." "She swallowed the dog to catch the cat." "She swallowed the cat to catch the bird." "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her." "She swallowed the spider to catch the fly." "I don't know why she swallowed the fly. Perhaps she'll die." "" "I know an old lady who swallowed a horse." "She's dead, of course!" } }
[ 1 8 food-chain ] unit-test
