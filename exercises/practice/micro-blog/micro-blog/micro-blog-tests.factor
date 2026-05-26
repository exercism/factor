USING: exercism-tools io kernel micro-blog tools.test unicode ;
IN: micro-blog.tests

"English language short" description
{ "Hi" }
[ "Hi" truncate ] unit-test

STOP-HERE

"English language long" description
{ "Hello" }
[ "Hello there" truncate ] unit-test

"German language short (broth)" description
{ "brühe" }
[ "brühe" truncate ] unit-test

"German language long (bear carpet → beards)" description
{ "Bärte" }
[ "Bärteppich" truncate ] unit-test

"Bulgarian language short (good)" description
{ "Добър" }
[ "Добър" truncate ] unit-test

"Greek language short (health)" description
{ "υγειά" }
[ "υγειά" truncate ] unit-test

"Maths short" description
{ "a=πr²" }
[ "a=πr²" truncate ] unit-test

"Maths long" description
{ "∅⊊ℕ⊊ℤ" }
[ "∅⊊ℕ⊊ℤ⊊ℚ⊊ℝ⊊ℂ" truncate ] unit-test

"English and emoji short" description
{ "Fly 🛫" }
[ "Fly 🛫" truncate ] unit-test

"Emoji short" description
{ "💇" }
[ "💇" truncate ] unit-test

"Emoji long" description
{ "❄🌡🤧🤒🏥" }
[ "❄🌡🤧🤒🏥🕰😀" truncate ] unit-test

"Royal Flush?" description
{ "🃎🂸🃅🃋🃍" }
[ "🃎🂸🃅🃋🃍🃁🃊" truncate ] unit-test
