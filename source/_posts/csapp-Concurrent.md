---
title: csapp Concurrent
date: 2019-05-10 18:14:49
tags: [csapp]
categories: Computer Science
---
# 基于进程
```c
Fork()
Signal(SIGCHLD, sigchld_handler)
```
共享信息比thread少，浪费资源



# 基于IO Multiplexing
就是使用select操作fdset
```c
int select(int n, fd_set *fdset, NULL,NULL,NULL);
```
fdset就是fd列表的bitmap,n是大小,有这些宏操作指令
```c
FD_ZERO(fd_set *fdset); //统统清空
FD_CLR(int fd,fd_set *fdset); //清掉一个fd
FD_SET(int fd,fd_set *fdset); //开一个fd
FD_ISSET(int fd,fd_set *fdset);//返回某个fd是开着的吗
```

[select.c](http://csapp.cs.cmu.edu/3e/ics3/code/conc/select.c)

# 基于线程
# API
```c
int pthread_create(pthread_t *tid, pthread_addr_t *addr, func *f, void *arg);
pthread_t pthread_self(void);
int pthread_exit(void *thread_return);
int pthread_cancel(pthread_t tid);
int pthread_join(pthread_t tid, void **thread_return);//阻塞，等tid结束，然后release它的资源，成功的话返回0
int pthread_detach(pthread_t tid);//分离tid，我不管tid了，它结束了就自己回收资源吧
int pthread_once(pthread_once_t *once_control, void (*init_routine)(void));

```

# 线程同步
共享变量count问题
```
其他指令H
movl count, %eax
leal l(%eax), %edx //count++
movl %edx, count
其他指令T
``` 
## 进度图
![progress-graph](https://fanjingdan012.github.io/2019/05/10/csapp-Concurrent/progress-graph.png)


## Semaphore
然后就要锁定不安全区
![semaphore-op](https://fanjingdan012.github.io/2019/05/10/csapp-Concurrent/semaphore-op.png)
![semaphore](https://fanjingdan012.github.io/2019/05/10/csapp-Concurrent/semaphore.png)
就是看每个点只能往上和往右走，但是P操作可能会被block，V操作是自由的
红线就是被block的P操作。保护出来走不到的点就是禁止区。

## 线程不安全的情况
1. 共享变量
2. 调用线程不安全的函数

## 死锁
![deadlock](https://fanjingdan012.github.io/2019/05/10/csapp-Concurrent/deadlock.png)
书里说的重叠就是死锁，不是说禁止区重叠，而是block的红线相交了，交点左下角那个地方又不能往上，又不能往右，死锁。
感觉这个进度图不太实用，一般判断死锁也不会去画这个。。。
