---
title: Bitcoin
date: 2019-10-17 17:13:12
tags:
---
# 官网
- [https://bitcoin.org](https://bitcoin.org)
- [https://bitcoin.org/bitcoin.pdf](https://bitcoin.org/bitcoin.pdf)

# 原理

## block的样子：
![block chain](https://fanjingdan012.github.io/2019/05/10/Bitcoin/blockchain.png)

## 通信
- 交易广播到每个node
- 每个node计算block
- 广播block
- Node接受还没被include的交易组成的valid 的 block
- Node如果接受一个block，就用这个block的hash继续计算新的block
- Node认为长的block chain是正确的
- 如果收到n个版本的block chain， 就先存下来，看谁长得快

# 磁盘空间
- 可信的block就可以扔掉，以节约磁盘空间，把交易hash到maerkle tree里，校验过就可以删掉
![merkletree](https://fanjingdan012.github.io/2019/05/10/Bitcoin/merkletree.png)
![diskspace](https://fanjingdan012.github.io/2019/05/10/Bitcoin/diskspace.png)
- 然后一个block就大概只有80byte，假设10min出一个block，一年的大小=80*6*24*365=4.2MB
