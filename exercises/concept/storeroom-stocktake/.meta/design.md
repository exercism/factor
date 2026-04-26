# Design

## Goal

Introduce hashtables and the `assocs` protocol by managing a warehouse
inventory.

## Learning objectives

- Build hashtables with `H{ }` and `H{ } clone`.
- Read with `at` and `key?`.
- Mutate with `set-at`, `change-at`, `inc-at`, `delete-at`.
- Convert back with `>alist` and `sort-keys`.

## Out of scope

- Custom assoc implementations and the full `assocs` protocol.
- `assoc-each`, `assoc-map`, `assoc-filter` — kept out so the focus
  stays on the simple key-by-key API.

## Concepts

- `assocs`: hashtable construction, lookup, mutation, and conversion.

## Prerequisites

- `sequences` — taught in `backyard-birdwatcher`.
- `quotations` — introduced in `high-school-sweetheart`.
