### 学习网络

#### TCP/IP四层模型

![img](images/tcpip4layers.jpg)

#### 三次握手四次挥手

![img](images/tcp_connect.png)
![img](images/tcp_close.png)
2MSL即两倍的Maximum Segment Lifetime，可通过net.ipv4.tcp_fin_timeout修改

#### TCP keepalive
|参数|socket级别设置|内核级别设置|说明|
|---|---|---|---|
|tcp_keepalive        | SO_KEEPALIVE | 只能在应用层设置             | 开启心跳检查|
|tcp_keepalive_time   | TCP_KEEPIDLE | net.ipv4.tcp_keepalive_time  | idle时多久发一次探测|
|tcp_keepalive_intvl  | TCP_KEEPINTVL| net.ipv4.tcp_keepalive_intvl | 无ack时多久发一次探测|
|tcp_keepalive_probes | TCP_KEEPCNT  | net.ipv4.tcp_keepalive_probes| 无ack时发几次探测|
