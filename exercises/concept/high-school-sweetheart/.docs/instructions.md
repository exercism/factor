# Instructions

You are going to help high school sweethearts profess their love on
social media by generating a unicode heart with their initials:

```
❤ J.  +  M. ❤
```

## 1. Clean up the name

Define `cleanupname` taking a name off the stack. Replace every `-`
with a space, then strip leading and trailing whitespace.

```factor
"Jane-Ann" cleanupname .
! => "Jane Ann"
```

## 2. Get the name's first letter

Define `firstletter` taking a name. Reuse `cleanupname` from the
previous task, then take the first character of the result and return
it as a one-character string.

```factor
"Jane" firstletter .
! => "J"
```

## 3. Format the first letter as an initial

Define `initial` taking a name. Reuse `firstletter` from the previous
task, uppercase it, then append a `.`.

```factor
"Robert" initial .
! => "R."
```

## 4. Put the initials inside of the heart

Define `couple` taking two names off the stack. Reuse `initial` from
the previous task on each name, then assemble the result:

```factor
"Blake Miller" "Riley Lewis" couple .
! => "❤ B.  +  R. ❤"
```
