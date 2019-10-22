---
title: B Tree B plus Tree and B star Tree
date: 2019-05-21 18:22:11
tags: [data structure, DB]
categories: Computer Science
---
# Index
- Hash
- linear index(memory or disk)就是一串key/pointer,key是顺序排列的，pointer指向具体记录
  ![linear-index](https://fanjingdan012.github.io/2019/05/21/B-Tree-B-plus-Tree-and-B-star-Tree/linear-index.png)
- tree

# B tree
多路搜索树，比如2-3 tree [2-3-4 tree=红黑树](https://fanjingdan012.github.io/2019/05/21/234-Tree-and-Red-Black-Tree/)
CRUD都在那边讲过了，这里贴个图方便对比
![b-tree](https://fanjingdan012.github.io/2019/05/21/B-Tree-B-plus-Tree-and-B-star-Tree/b-tree.png)
## 为了做index的性质
- balanced：所有叶子都是一层的
- 一般一个node的大小就是一个page/disk block，最好填满
- full：m-order B树就是除了根（有>2个孩子）和叶子，每个node有m/2到m个孩子（几路B树就是几个孩子）

# B+ tree
## 在B tree的基础上：
- 所有真正的数据都在叶子层
- m路B+树叶子节点可以存>m条
- 至少半满
- 所有叶子再连成doubly-linked list
![b+tree.png](https://fanjingdan012.github.io/2019/05/21/B-Tree-B-plus-Tree-and-B-star-Tree/b+tree.png)

## CRUD
### C：叶子没满不用说，满了就split
### D：保证至少半满，最小化split开销，localize

# B* tree
## 在B+ tree的基础上：
- overflow的时候塞给兄弟，underflow的时候合并兄弟
- 普通node上也加linked list
![bstar-tree.png](https://fanjingdan012.github.io/2019/05/21/B-Tree-B-plus-Tree-and-B-star-Tree/bstar-tree.png)