# Instructions

A busy bank serves waiting customers by *priority* rather than in the
order they arrived. Each customer is given a priority number when they
take a ticket, and the teller always serves the lowest number next
(`1` is the most urgent). A min-heap is the perfect waiting line.

## 1. Open the queue

Define `new-queue`, taking nothing and returning a fresh, empty
priority queue.

```factor
new-queue
! => an empty priority queue
```

## 2. Add a customer

Define `join-queue`, taking a customer name, a priority number, and a
queue. It adds the customer to the queue and returns the queue, so
customers can be added one after another.

```factor
new-queue "alice" 5 rot join-queue "bob" 2 rot join-queue
! => the queue, now holding alice (5) and bob (2)
```

## 3. Who's next?

Define `next-name`, taking a queue and returning the name of the
customer who should be served next — the one with the lowest priority
number — *without* removing them.

```factor
new-queue "alice" 5 rot join-queue "bob" 2 rot join-queue next-name .
! => "bob"
```

## 4. Serve everyone

Define `serve-all`, taking a queue and returning the names of all
waiting customers, in the order they would be served.

```factor
new-queue "alice" 5 rot join-queue "bob" 2 rot join-queue
"carol" 9 rot join-queue serve-all .
! => { "bob" "alice" "carol" }
```
