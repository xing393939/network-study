### icmp协议

#### 参考文章
* [RFC 792](https://datatracker.ietf.org/doc/html/rfc792)
* [how does linux nat a ping?](https://news.ycombinator.com/item?id=37455621)

```
// ping 1.1.1.1 的抓包
src=192.168.2.119 dst=1.1.1.1 type=0x08 code=0x00 checksum=0x4d49 id=0x0001 seq=0x0012
src=192.168.2.119 dst=1.1.1.1 type=0x00 code=0x00 checksum=0x5549 id=0x0001 seq=0x0012

src=192.168.2.119 dst=1.1.1.1 type=0x08 code=0x00 checksum=0x4d48 id=0x0001 seq=0x0013
src=192.168.2.119 dst=1.1.1.1 type=0x00 code=0x00 checksum=0x5548 id=0x0001 seq=0x0013

src=192.168.2.119 dst=1.1.1.1 type=0x08 code=0x00 checksum=0x4d47 id=0x0001 seq=0x0014
src=192.168.2.119 dst=1.1.1.1 type=0x00 code=0x00 checksum=0x5547 id=0x0001 seq=0x0014
```

![](../images/icmp-1.png)

![](../images/icmp-2.png)