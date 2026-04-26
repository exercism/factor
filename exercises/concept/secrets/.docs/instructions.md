# Instructions

Your friend has just sent you a message with an important secret. Not
wanting to make it easy for others to read it, the message was
encrypted by performing a series of bit manipulations. You will need
to write the words to help decrypt the message.

## 1. Shift back the bits

The first step in decrypting the message is to undo the shifting from
the encryption process by shifting the bits back to the right. The
later steps assume that zeros are inserted from the left.

Define `shift-back` taking a 32 bit value and an amount, returning
the value shifted right by that amount with zero fill.

```factor
0b1001 2 shift-back .
! => 0b0010
```

## 2. Set some bits

Next, there are some bits that need to be set to 1.

Define `set-bits` taking a value and a mask. Every bit of `value`
where the corresponding bit of `mask` is 1 should be set to 1; every
other bit is left unchanged.

```factor
0b0110 0b0101 set-bits .
! => 0b0111
```

## 3. Flip specific bits

Some bits are flipped during encryption. They will need to be flipped
back to decrypt the message.

Define `flip-bits` taking a value and a mask. Every bit of `value`
where the corresponding bit of `mask` is 1 should be flipped; every
other bit is left unchanged.

```factor
0b1100 0b0101 flip-bits .
! => 0b1001
```

## 4. Clear specific bits

Lastly, there are also certain bits that always decrypt to 0.

Define `clear-bits` taking a value and a mask. Every bit of `value`
where the corresponding bit of `mask` is 1 should be cleared to 0;
every other bit is left unchanged.

```factor
0b0110 0b0101 clear-bits .
! => 0b0010
```
