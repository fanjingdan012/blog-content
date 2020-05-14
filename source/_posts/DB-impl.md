---
title: DB impl
date: 2019-11-05 14:10:04
tags:
---
plan-node impl
- select impl
- project impl
- group/aggr impl
- sort impl (n way merge sort, external sort)
- Theta-Join
  - other not fit all but fast
    - Sort-Merge Join
    - Hash Join

Transaction
- Atomic
  - fsync()
  - journaling filesystem
  - RAID
  - reliable power
- Shadow-copy
  - Shadow-paging
- Write-Ahead Logging(WAL):
  - WAL rule:log完<==>commit, data defered
  - redo-only: when roll back, cannot undo, 红字发票
  - Force/No-Force:data updated/not updated before reporting "commited"
  - Steal/No-Steal:data update allowed/not allowed before txn finish
- Crash recover
  - 1.redo phase
  - 2.undo phase

Index

Function


Storage
