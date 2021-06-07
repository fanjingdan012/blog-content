---
title: Performance Log
date: 2020-12-01 17:03:23
tags: [performance]
categories: Computer Science
---
```
"i": 1,  //total invoking #
"t": 104842, //total invoking time(ms).
"slft": 104842,//execution time taken by the function itself. slft = t - sum(sub.t)
"st": 4337277,//Another time tracking for sql execution, it starts from statement.execute, ends when statement.close is invoked. [ms]
"m": 56154194, // m: Memory consumption of the Thread. it starts from statement.execute, ends when statement.close is invoked. [KB]
"nr": 339007,//Network read for the Thread. it starts from statement.execute, ends when statement.close is invoked. [KB]
"rt": 1635,//Accumulated time for rs.next() execution. [ms]
"rn": 2645257, // Result number for the query. We get this by counting execution # of rs.next().
"fs": 0 //Fetch Size for the query.
n means function name of the node.
```
Parent child relationship in the tree, means, child node execution happened totally in parent node execution time slot.
