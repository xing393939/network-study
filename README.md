### 学习网络

#### TCP/IP四层模型

![img](images/tcpip4layers.jpg)

#### RFC协议
* [Official Internet Protocol Standards](https://www.rfc-editor.org/standards.php)

|STD|协议|RFC编号|
|---|---|---|
|STD 5       | IP   | [791](http://www.rfc-editor.org/rfc/rfc791.html)|
|STD 5       | ICMP | [792](http://www.rfc-editor.org/rfc/rfc792.html)|
|STD 7       | TCP  | [9293](http://www.rfc-editor.org/rfc/rfc9293.html)|
|STD 37      | ARP  | [826](http://www.rfc-editor.org/rfc/rfc826.html) [详解](https://zhuanlan.zhihu.com/p/427573801)|
|STD 86      | IPv6 | [8200](http://www.rfc-editor.org/rfc/rfc8200.html)|
|STD 89      | ICMPv6 | [4443](http://www.rfc-editor.org/rfc/rfc4443.html)|
|            | NDPv6 | [4861](http://www.rfc-editor.org/rfc/rfc4861.html)，取代ARP|

#### 三次握手四次挥手

![img](images/tcp_connect.png)
![img](images/tcp_close.jpg)

#### conntrack
* [连接跟踪（conntrack）详述](https://blog.csdn.net/alittlefish1/article/details/119967745)
* 没有连接跟踪只能对单个数据包进行过滤，有了后从第一个包到最后一个包都可以关联到一起
* 如ftp、sip、tftp等有控制连接和数据连接，两个连接是有从属关系的，过滤这样的包没有连接跟踪不好做
* 要实现NAT，就需要连接跟踪

![img](images/conntrack_callstack.png)

#### TCP keepalive
|参数|socket级别设置|内核级别设置|说明|
|---|---|---|---|
|tcp_keepalive        | SO_KEEPALIVE | 只能在应用层设置             | 开启心跳检查|
|tcp_keepalive_time   | TCP_KEEPIDLE | net.ipv4.tcp_keepalive_time  | idle时多久发一次探测|
|tcp_keepalive_intvl  | TCP_KEEPINTVL| net.ipv4.tcp_keepalive_intvl | 无ack时多久发一次探测|
|tcp_keepalive_probes | TCP_KEEPCNT  | net.ipv4.tcp_keepalive_probes| 无ack时发几次探测|
