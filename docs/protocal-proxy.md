### PROXY Protocol

#### 参考文章
* [Exploring the PROXY Protocol](https://seriousben.com/posts/2020-02-exploring-the-proxy-protocol/)
* 介于传输层和应用层之间的代理协议

```
     0                   1                   2                   3
Bits 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +                                                               +
    |                  Proxy Protocol v2 Signature                  |
    +                                                               +
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |Version|Command|   AF  | Proto.|         Address Length        |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                      IPv4 Source Address                      |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                    IPv4 Destination Address                   |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Source Port          |        Destination Port       |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

Signature:           固定12字节：0d 0a 0d 0a 00 0d 0a 51 55 49 54 0a
Version:             4Bits，目前版本号是2
Command:             4Bits，0表示LOCAL，1表示PROXY
Address Family:      4Bits
                     \x0 (binary: 0000): AF_UNSET: Used for the LOCAL command.
                     \x1 (binary: 0001): AF_INET: IPv4
                     \x2 (binary: 0010): AF_INET6: IPv6
                     \x3 (binary: 0011): AF_UNIX: UNIX
Transport Protocol:  4Bits
                     \x0 (binary: 0000): AF_UNSET: Used for the LOCAL command.
                     \x1 (binary: 0001): STREAM: TCP
                     \x2 (binary: 0010): DGRAM: Datagram (UDP or SOCK_DGRAM)
Address Length:      2 bytes (地址+端口字段所占字节)
Source Address:      4 bytes (IPv4)
Destination Address: 4 bytes (IPv4)
Source Port:         2 bytes (IPv4)
Destination Port:    2 bytes (IPv4)
```




