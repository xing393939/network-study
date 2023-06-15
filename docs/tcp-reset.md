### TCP reset的场景

#### 参考资料
* [实战:tcp链接rst场景tcpdump分析](https://www.cnblogs.com/muahao/p/9257166.html)

1，针对不存在的端口的连请求：telnet 192.168.2.120 52200
```
09:14:25.209695 IP 172.26.57.241.41498 > 192.168.2.120.52200: Flags [S], seq 4126009844, win 64240, options [mss 1460,sackOK,TS val 3116949491 ecr 0,nop,wscale 7], length 0
09:14:25.210643 IP 192.168.2.120.52200 > 172.26.57.241.41498: Flags [R.], seq 0, ack 4126009845, win 0, length 0
```

2，客户端在第一次握手后断开连接：tcp-reset/connect-timeout
```
// 连接国外服务器，connect超过100ms就关闭连接
09:43:20.233041 IP 172.26.57.241.52568 > 119.111.132.34.bc.googleusercontent.com.ssh: Flags [S], seq 892811371, win 64240, options [mss 1460,sackOK,TS val 85074024 ecr 0,nop,wscale 7], length 0
09:43:20.497136 IP 119.111.132.34.bc.googleusercontent.com.ssh > 172.26.57.241.52568: Flags [S.], seq 2070286581, ack 892811372, win 64768, options [mss 1420,sackOK,TS val 1395913942 ecr 85074024,nop,wscale 7], length 0
09:43:20.497198 IP 172.26.57.241.52568 > 119.111.132.34.bc.googleusercontent.com.ssh: Flags [R], seq 892811372, win 0, length 0
```

3，服务端收到数据后没有读完就关闭：tcp-reset/socket-linger
```
// 服务端读完数据再关闭是正常四次挥手：
10:00:58.546545 IP 172.26.48.1.16319 > 172.26.57.241.8888: Flags [S], seq 3909499080, win 64240, options [mss 1460,nop,wscale 8,nop,nop,sackOK], length 0
10:00:58.546622 IP 172.26.57.241.8888 > 172.26.48.1.16319: Flags [S.], seq 1326547430, ack 3909499081, win 64240, options [mss 1460,nop,nop,sackOK,nop,wscale 7], length 0
10:00:58.546809 IP 172.26.48.1.16319 > 172.26.57.241.8888: Flags [.], ack 1, win 8212, length 0
10:00:59.837538 IP 172.26.48.1.16319 > 172.26.57.241.8888: Flags [P.], seq 1:2, ack 1, win 8212, length 1
10:00:59.837653 IP 172.26.57.241.8888 > 172.26.48.1.16319: Flags [.], ack 2, win 502, length 0
10:00:59.840525 IP 172.26.57.241.8888 > 172.26.48.1.16319: Flags [F.], seq 1, ack 2, win 502, length 0
10:00:59.841152 IP 172.26.48.1.16319 > 172.26.57.241.8888: Flags [.], ack 2, win 8212, length 0
10:00:59.841894 IP 172.26.48.1.16319 > 172.26.57.241.8888: Flags [F.], seq 2, ack 2, win 8212, length 0
10:00:59.841979 IP 172.26.57.241.8888 > 172.26.48.1.16319: Flags [.], ack 3, win 502, length 0

// 服务端没有读完数据再关闭则发送reset包

```

