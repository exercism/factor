USING: exercism-tools io kernel micro-blog tools.test unicode ;
IN: micro-blog.tests

"Micro Blog:" print

"English language short" print
{ "Hi" }
[ "Hi" truncate ] unit-test

STOP-HERE

"English language long" print
{ "Hello" }
[ "Hello there" truncate ] unit-test

"German language short (broth)" print
{ "brühe" }
[ "brühe" truncate ] unit-test

"German language long (bear carpet → beards)" print
{ "Bärte" }
[ "Bärteppich" truncate ] unit-test

"Bulgarian language short (good)" print
{ "Добър" }
[ "Добър" truncate ] unit-test

"Greek language short (health)" print
{ "υγειά" }
[ "υγειά" truncate ] unit-test

"Maths short" print
{ "a=πr²" }
[ "a=πr²" truncate ] unit-test

"Maths long" print
{ "∅⊊ℕ⊊ℤ" }
[ "∅⊊ℕ⊊ℤ⊊ℚ⊊ℝ⊊ℂ" truncate ] unit-test

"English and emoji short" print
{ "Fly 🛫" }
[ "Fly 🛫" truncate ] unit-test

"Emoji short" print
{ "💇" }
[ "💇" truncate ] unit-test

"Emoji long" print
{ "❄🌡🤧🤒🏥" }
[ "❄🌡🤧🤒🏥🕰😀" truncate ] unit-test

"Royal Flush?" print
{ "🃎🂸🃅🃋🃍" }
[ "🃎🂸🃅🃋🃍🃁🃊" truncate ] unit-test
