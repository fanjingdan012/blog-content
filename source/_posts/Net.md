---
title: Net
date: 2019-05-09 18:42:07
tags: [csapp]
categories: Computer Science
---

![net](https://fanjingdan012.github.io/2019/05/09/Net/net.jpg)
# OSI七层模型
![layers](https://fanjingdan012.github.io/2019/05/09/Net/layers.png)
数据：
![data](https://fanjingdan012.github.io/2019/05/09/Net/data.png)

internet connection:
1. 点对点
2. 全双工Full-duplex：双向同时可以传输信息
3. 可靠：最终会按照顺序收到所有包

# Network
SAN(System Area Network):cluster级别
LAN(Local ...):building, campus
WAN(Wide ...):world
internet:一堆network以共享的router互联, Internet: internet的最著名实现

# Socket API
```c
int getaddrinfo(const char *host,              
                const char *service            /* port or service name */
                const struct addrinfo *hints,  /* input parameters */
                struct addrinfo **result)      /* 这个其实是返回值linked list<addrinfo> */
//然后server端就会轮询这个linked list，尝试连接socket，直到bind成功
//client端轮询这个linked list，尝试连接socket，直到connect成功
void freeaddrinfo(struct addrinfo *result)     
//free linked list
const char *gai_strerror(int errcode)          
//return error message
int socket(int domain, int type, int protocol)
//3个参数总是AF_INET SOCK_STREAM 0，就是创建socket
int bind(int sockfd, SA *addr, socklen_t addrlen)
//告诉kernal把addr和sockfd bind起来
int listen(int sockfd, int backlog)
//kernal 默认socket函数的fd都是active socket，这个函数是告诉kernal把这个sockfd变成server端的listening socket,阻塞的
int accept(intlistenfd, SA *addr, int *addrlen)
 //server 等待connect连上来，后两个参数其实是返回值，客户端的socket地址和地址长度,函数本身的返回值是connected fd
int connect(int clientfd, SA *addr, socklen_t addrlen)
//也是阻塞的
int open_listenfd(int port)=socket+bind+listen
int open_clientfd()=socket+connect
```
socket
socket address= IP地址:port
![socket-api](https://fanjingdanhttps://fanjingdan012.github.io/2019/05/09/Net/
# Example Code
一个小型server，main方法进来，无限循环accept(),然后doit()做一些读写和处理
[tiny.c](http://csapp.cs.cmu.edu/3e/ics3/code/netp/tiny/tiny.c)

# DNS
```
$> nslookup localhost
127.0.0.1
```
# ARP
1：首先，每个主机都会在自己的ARP缓冲区中建立一个ARP列表，以表示IP地址和MAC地址之间的对应关系。

2：当源主机要发送数据时，首先检查ARP列表中是否有对应IP地址的目的主机的MAC地址，如果有，则直接发送数据，如果没有，就向本网段的所有主机发送ARP数据包，该数据包包括的内容有：源主机IP地址，源主机MAC地址，目的主机的IP地址。

3：当本网络的所有主机收到该ARP数据包时，首先检查数据包中的IP地址是否是自己的IP地址，如果不是，则忽略该数据包，如果是，则首先从数据包中取出源主机的IP和MAC地址写入到ARP列表中，如果已经存在，则覆盖，然后将自己的MAC地址写入ARP响应包中，告诉源主机自己是它想要找的MAC地址。

4：源主机收到ARP响应包后。将目的主机的IP和MAC地址写入ARP列表，并利用此信息发送数据。如果源主机一直没有收到ARP响应数据包，表示ARP查询失败。
