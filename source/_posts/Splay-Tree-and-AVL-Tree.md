---
title: Splay Tree and AVL Tree
date: 2019-05-21 18:10:40
tags: [data structure]
categories: Computer Science
---
# Splay Tree
一套规则，用于提高BST的读效率，当node s 被读到，就进行splay，也就是说读得多的靠近根
- single rotation
![single-rotation](https://fanjingdan012.github.io/2019/05/21/Splay-Tree-and-AVL-Tree/single-rotation.png)
- double rotation
  - zigzag
    ![zigzag](https://fanjingdan012.github.io/2019/05/21/Splay-Tree-and-AVL-Tree/zigzag.png)
  - zigzig
    ![zigzig](https://fanjingdan012.github.io/2019/05/21/Splay-Tree-and-AVL-Tree/zigzig.png)

# AVL Tree(Adelson-Velskii-Landis):平衡树
- balance factor BF(node) = 左孩子高度-右孩子高度=-1,0,1
- rotation：就是看长出来的树是右孩子的右孩子就是RR，依次类推，
  - RR rotation
    ![RR](https://fanjingdan012.github.io/2019/05/21/Splay-Tree-and-AVL-Tree/RR.png)
  - LL rotation
    ![LL](https://fanjingdan012.github.io/2019/05/21/Splay-Tree-and-AVL-Tree/LL.png)
  - LR rotation
    ![LR](https://fanjingdan012.github.io/2019/05/21/Splay-Tree-and-AVL-Tree/LR.png)
  - RL rotation
    ![RL](https://fanjingdan012.github.io/2019/05/21/Splay-Tree-and-AVL-Tree/RL.png)
