---
title: csapp IO
date: 2019-05-07 15:19:51
tags: [csapp]
categories: Computer Science
---
标准输入STDIN_FILENO=0 标准输出STDOUT_FILENO=1 标准错误 STDERR_FILENO=2
文件位置k=0
# 打开关闭
```c
int open(char *filename, int flags, mode_t mode)
int close(int fd)
```

# 读写
```c
ssize_t read (int fd, void *buf, size_t n) //从fd读取n个byte到buf里
ssize_t write(int fd, const void *buf, size_t n)
```
ssize_t是int而size_t是unsigned int

# Rio(Robust io)
```c
ssize_t rio_readn (int fd, void *usrbuf, size_t n)
ssize_t rio_writen (int fd, void *usrbuf, size_t n)
```

# 读取文件元数据
```c
int stat(const char *filename , struct stat *buf)
int fstat(int fd, struct stat *buf)
```
# 内核处理
![io](https://fanjingdan012.github.io/2019/05/07/csapp-IO/io.png)
![io-share](https://fanjingdan012.github.io/2019/05/07/csapp-IO/io-share.png)
![io-subthread](https://fanjingdan012.github.io/2019/05/07/csapp-IO/io-subthread.png)

# 重定向
```c
int dup2(int oldfd, int new fd)
```
![io-dup2](https://fanjingdan012.github.io/2019/05/07/csapp-IO/io-dup2.png)

# 所有函数
![io-apis](https://fanjingdan012.github.io/2019/05/07/csapp-IO/io-apis.png)