### icmp协议

#### 参考文章
* [RFC 792](https://datatracker.ietf.org/doc/html/rfc792)
* [how does linux nat a ping?](https://news.ycombinator.com/item?id=37455621)

#### how does linux nat a ping
```go
# 1. windows上对 ping 1.1.1.1 进行抓包
src=192.168.2.119 dst=1.1.1.1 type=0x08 code=0x00 checksum=0x4d49 id=0x0001 seq=0x0012
src=192.168.2.119 dst=1.1.1.1 type=0x00 code=0x00 checksum=0x5549 id=0x0001 seq=0x0012

src=192.168.2.119 dst=1.1.1.1 type=0x08 code=0x00 checksum=0x4d48 id=0x0001 seq=0x0013
src=192.168.2.119 dst=1.1.1.1 type=0x00 code=0x00 checksum=0x5548 id=0x0001 seq=0x0013

src=192.168.2.119 dst=1.1.1.1 type=0x08 code=0x00 checksum=0x4d47 id=0x0001 seq=0x0014
src=192.168.2.119 dst=1.1.1.1 type=0x00 code=0x00 checksum=0x5547 id=0x0001 seq=0x0014

# 2. 使用strace跟踪ping命令的系统调用
socket(AF_INET, SOCK_RAW, IPPROTO_ICMP) = 3
setsockopt(3, SOL_RAW, ICMP_FILTER, ~(1<<ICMP_ECHOREPLY|1<<ICMP_DEST_UNREACH|1<<ICMP_SOURCE_QUENCH|1<<ICMP_REDIRECT|1<<ICMP_TIME_EXCEEDED|1<<ICMP_PARAMETERPROB), 4) = 0
setsockopt(3, SOL_IP, IP_RECVERR, [1], 4) = 0
setsockopt(3, SOL_SOCKET, SO_SNDBUF, [324], 4) = 0
setsockopt(3, SOL_SOCKET, SO_RCVBUF, [65536], 4) = 0
setsockopt(3, SOL_SOCKET, SO_TIMESTAMP, [1], 4) = 0
setsockopt(3, SOL_SOCKET, SO_SNDTIMEO, "\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 16) = 0
setsockopt(3, SOL_SOCKET, SO_RCVTIMEO, "\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 16) = 0
sendto(3, "\10\0\255a8=\0\1\300g\1e\0\0\0\0\216\300\3\0\0\0\0\0\20\21\22\23\24\25\26\27"..., 64, 0, {sa_family=AF_INET, sin_port=htons(0), sin_addr=inet_addr("1.1.1.1")}, 16) = 64
recvmsg(3, {msg_name={sa_family=AF_INET, sin_port=htons(0), sin_addr=inet_addr("1.1.1.1")}, ...}, 0) = 84

# 3. 步骤2的sendto的系统调用，第2个参数字符串被截断了(应该有64字节)，解决如下：
strace -s 2048 -xx 表示保留2048字符，并以16进制打印

# 4. 步骤3对应的tcpdump抓包，可以得到对应数据的hex展示，icmp数据包(有64字节)如下
0800aaee38a400015884016500000000edaf0e0000000000101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f3031323334353637
```

![](../images/icmp-1.png)

![](../images/icmp-2.png)