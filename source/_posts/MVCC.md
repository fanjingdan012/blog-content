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

# single-version scheme
- DB2
- Sybase

# Concurrency Control Protocol

# Version Storage

# GC

# Index
