### mac协议

#### 参考文章
* [Ethernet frame](https://en.wikipedia.org/wiki/Ethernet_frame)
* [Ethernet frame - EtherType](https://en.wikipedia.org/wiki/EtherType#Values)
* [Ethernet Version 2 Versus IEEE 802.3 Ethernet](https://www.ibm.com/support/pages/ethernet-version-2-versus-ieee-8023-ethernet)

```
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |  MAC dst  |  MAC src  | E |                           |  FCS  |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
                          Ethernet II 在二层协议的定义

MAC dst: 目标mac
MAC src: 原始mac
E:       EtherType
         0x0800 - IPv4
         0x0806 - ARP
         0x86DD - IPv6
FCS:     Frame Check Sequence，wireshark抓包不会展示它
```



