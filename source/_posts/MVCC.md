---
title: MVCC:Multi-Version Concurrency Control
date: 2019-05-24 13:54:36
tags: [DB, CMU15721]
categories: Computer Science
---
一条记录有n个物理版本
- 读：读最新version
- 写：创建新version
- 支持time-travel query，即回溯版本

[一定要看的论文](https://15721.courses.cs.cmu.edu/spring2019/papers/03-mvcc1/wu-vldb2017.pdf)

# single-version scheme
- DB2
- Sybase

# Concurrency Control Protocol
## Timestamping Ordering(MV-TO)
## Optimistic Concurrency Control(MV-OCC)
## Two-Phase Locking(MV-2PL)

# Version Storage
## Append-Only Storage
      - 只有主表
## Time-Travel Storage
      - 主表+time-travel table(全量)
## Delta Storage
      - 主表+Delta Storage Segment(只有Delta部分)
# GC
- 删掉aborted txn创建的版本

## Tuple-level
## Transaction-level
# Index
# MVCC应用
- Oracle
- Postgres
- MySQL's InnoDB
- Microsoft Hekaton
- SAP HANA
- MemSQL
- NuoDB
- HYRISE
- HyPer
