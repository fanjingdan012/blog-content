---
title: Memory Hierachy
date: 2018-04-11 09:39:10
tags: [csapp]
categories: Computer Science
---
![memory.png](https://fanjingdan012.github.io/2018/04/11/Memory-Hierachy/memory.png)
# 存储技术(书6)
- RAM(Random Access Memory)
  - SRAM(Static RAM)
    - 快，10倍速度DRAM
    - 贵，100倍价格DRAM
    - 做Cache
  - DRAM(Dynamic RAM)
    - 主存
    - frame buffer
    - 增强版DRAM
      - SDRAM(Synchronous DRAM)
      - Double Data-Rate SDRAM(DDR SDRAM)
        - DDR(2bit prefetch buffer) 
        - DDR2(4bit ...) 
        - DDR3(8bit ...)
  - 访问主存
    - 读
      `movq A, %rax`
      1. CPU通过总线接口发起读事务，把地址A放到系统总线上
      2. A走过I/O桥接器，走到存储器总线
      3. 主存感觉并获取A，读取A的内容，写到存储器总线
      4. I/O桥接器翻译转换成系统总线信号
      5. CPU感觉并获取数据，copy给%rax

    - 写
      `movq %rax A`
      1. CPU把A放在总线上
      2. 主存从总线获取A，并等待数据到达
      3. CPU把%rax的数据copy到总线
      4. 主存拿到数据存入A

- 断电可以存储的
  - ROM(Read-only memory)
  - PROM(Programmable ROM) 可以烧制一次程序
  - EPROM(Eraseable PROM) 可以重复烧制
  - EEPROM(Electrically Eraseable PROM) 比如Flash memory
  - 磁盘
    见图

# Locality局部性
- 时间局部性：一个变量在集中的时间里一直访问就会一直cache hit
- 空间局部性：相关数据放在一起（一个 block）就会一起进缓存

# Hierarchy
![memory-hierarchy.png](https://fanjingdan012.github.io/2018/04/11/Memory-Hierachy/memory-hierarchy.png)
## Disk
见上图
## Cache
见上图
- 上层是下层的子集
- 数据以块传输
- 下层更大，慢，便宜
- 读：hit的话直接返回，miss的话replace
  - cache hit
  - cache miss
    - cold miss、compulsory miss（强制性不命中）
    - conflict miss，e.g.用了下一层的块i放在上一层的块（i mod 4）中的放置策略，然后访问块0,块4,块0,块4。。。就会一直miss 
    - capacity miss：缓存太小了
  - replacing、evicting victim block，只要发生了不命中就会执行某替换策略
    - 策略
      - 换掉谁？e.g.Least Recent Used（LRU）, Frequently(LFU)
      - 新的放哪? e.g. 随机， 下一层的块i放在上一层的块（i mod 4）中
- 写：
  - write hit
    - write-through：直接更新主存
    - write-back（真的用的）：推迟更新主存,减少bus的使用，需要额外维护一个dirty bit，标记是不是改过
  - write miss
    - write-allocate（真的用的）:先加载到cache，再更新+write-back
    - not-write-allocate：直接更新主存+write-through
- 保存啥的
  - i-cache：存指令
  - d-cache：存数据
  - unified cache：两个都存，e.g. L2
- KPI
  - miss rate = 1- hit rate
  - hit time(命中花多久)、 miss penalty（不命中花多久）

# Virtual Memory(书10.1-10.8)
## Why Virtual Memory
- 4k/4m/...一个page，搞cache
- memory管理，每个进程有自己的<b>地址空间</b>, 2G的物理内存虚拟出4G没问题
- memory保护，可以做权限管理，在PTE上加权限位，MMU负责检查
## How
见上图
## Memory mapping

# Heap & Malloc(书10.9)

