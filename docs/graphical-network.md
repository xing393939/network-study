### 图解网络

#### 参考资料
* [图解网络](https://xiaolincoding.com/network/)

#### 2.2 键入网址到网页显示，期间发生了什么
* 域名DNS解析依次是：
  * 根 DNS 服务器（.）
  * 顶级域 DNS 服务器（.com）
  * 权威 DNS 服务器（server.com）
* 如果机器有多个网卡，需要通过路由表要确定使用哪张网卡和saddr：
  * `route -n`的字段：Destination、Gateway、Genmask、Iface
  * 将daddr和Genmask作与运算，看是否和Destination匹配，是则选取Iface
  * （若Destination和Genmask都是0.0.0.0，表示兜底策略）
  * （若Gateway是0.0.0.0，表示是二层网络，不需要网关）
* 网卡发包：dmac通过arp广播获取
* 交换机流程：
  * 收包后dmac在mac表已存在，根据mac表把包发给对应的设备
  * 收包后dmac在mac表不存在，把包发给所有设备，待设备回应后更新mac表
* 路由器-转发网关：A机器——X网关左手——X网关右手——B机器
  * A机->X左：macA机，ipA -> macX左，ipB
  * X左->X右：macX左，ipA -> macX右，ipB
  * X右->B机：macX右，ipA -> macB机，ipB
* 路由器-NAT网关：A机器——X网关——Y网关——B机器
  * A机->X关：macA机，ipA -> macX关，ipY
  * X关->Y关：macX关，ipX -> macY关，ipY
  * Y关->B机：macY关，ipY -> macB机，ipB
  * 其中A机器，ipA是它的内网ip，ipX是它的外网ip，B机器同理
  * 第二步中X网关把源ipA变成ipX的过程是SNAT：源地址转换
  * 第三步中Y网关把目标ipY变成ipB的过程是DNAT：目标地址转换

#### 2.3 linux网络是如何收发网络包的
* 发送TCP网络包，三次数据拷贝：
  * 进入内核态时，先拷贝为内核态的 sk_buff 内存
  * 传输层到网络层时，会拷贝一个副本 sk_buff，此副本在网卡发送成功后会释放掉
  * 传输层到网络层时，当收到ACK响应后，释放原始的 sk_buff
  * 当网络层发现 sk_buff 大于MTU时，还需要分片

#### 3.1 HTTP常见面试题
* 浏览器缓存
  * 根据Cache-Control，决定是否读本地缓存
  * 根据Etag发起请求（header头设置If-None-Match），如果是304则读本地缓存
* HTTP/1.1：有http-keepalive
* HTTP/2.0：
  * 头部压缩：相同header头只发一次
  * 二进制格式：header头和数据都是pb格式
  * 并发传输：每个请求分成若干个frame，但是有相同的streamId
  * 服务器主动推送资源
* HTTP/3.0：
  * 无队头阻塞：使用udp，避免tcp的队头阻塞问题
  * 更快的连接建立：tcp+tls是分层的，tcp三次握手+tls四次握手，而quic是一起的
  * 连接迁移：采用连接id而不是五元组，这样就算客户端ip变了，连接也没有断开

#### 4.1 TCP 三次握手与四次挥手面试题
* UDP头部有data的长度字段，TCP没有，TCP的data的长度计算方式如下：
  * ip包总长度 - ip头长度 - tcp头长度
  * （UDP其实也能这样算data的长度）
* TCP 和 UDP 可以使用同一个端口
* 第一次握手丢包后：假设net.ipv4.tcp_syn_retries=3
  * 第1次重传是在1秒后
  * 第2次重传是在2秒后
  * 第3次重传是在4秒后
  * 8秒后仍然没有收到ack则放弃
* 第二次握手丢包后，假设net.ipv4.tcp_synack_retries=3
  * 效果同上
* 第三次握手丢包后，不会重传包，因为客户端已经是ESTABLISH状态了
  * 此后客户端发送数据时，ack还是丢包的那个ack相同，服务端会自动建立好连接并接收数据
* 第一次挥手丢包后，假设tcp_orphan_retries=3
  * 效果同上，最后进入closed状态
* 第二次挥手丢包后，不会重传包，此时处于CLOSE_WAIT
  * 内核不会主动关闭连接，除非用户态调用了close
* 第三次挥手丢包后，假设tcp_orphan_retries=3
  * 服务端效果同上，最后进入closed状态
  * 客户端处于FIN_WAIT_2，等待tcp_fin_timeout秒关闭
* 第四次挥手丢包后，不会重传包，等待2MSL关闭
  * 2MSL = `#define TCP_TIMEWAIT_LEN` = 60秒

#### 4.2 TCP 超时重传、滑动窗口、流量控制、拥塞控制
* 超时重传-名词：
  * RTT：发送方发包到收到ack包的时间间隔
  * RTO：发送方发包丢包后多久重发包
  * `新的SRTT = (1 - α)·旧的SRTT + α·最新的RTT`
  * `RTO = SRTT + 4·rttvar`，其中rttvar表示SRTT与真实值的差距
  * linux的RTO初始值三次握手是1秒(写死在内核)，其他包是0.2秒(可调整)
* 超时重传-三种方案：假设序号2、3丢包
  * 快速重传：发送方收到三个重复序号2的ack。（问题是序号3也丢包了，也需要三次ack？）
  * SACK：ack包会告知哪个范围的包已经收到了
  * D-SACK：ack包会告知哪个范围的包被重复接收了
* 流量控制：
  * 接收方通过ack告知自己的窗口大小
  * （接收方可能会ack告知自己的窗口为0）
  * 窗口关闭：若已ack自己的窗口为0，再发ack告知窗口大于0时，ack包丢包了
  * （此时发送方需要定时发送测探包）
  * 糊涂窗口综合征：当窗口很小时，会发送很多小包，这样不经济
  * （此时接收方可以在接收窗口很小的时候直接通告窗口为0）
  * （此时发送方可以在发送窗口很小的时候延迟发包）
* 拥塞控制：
  * 慢启动(cwnd < ssthresh)：cwnd从1开始，后面指数增长
  * 拥塞避免(cwnd >= ssthresh)：
  * 拥塞发生：
    * 发生了超时重传：ssthresh = cwnd / 2 && cwnd = 0
    * 发生了快速重传：ssthresh = cwnd / 2 && cwnd = cwnd / 2
  * 快速恢复（即发生了快速重传）
    * 开始时：ssthresh = cwnd / 2 && cwnd = cwnd / 2 + 3
    * 过程中：每收到一个ack，cwnd = cwnd + 1
    * 结束时：当收到新数据的ack退出快速恢复，cwnd变成原窗口大小的一半

#### 4.3 TCP 实战抓包分析
* [Linux tcp fast open](https://blog.csdn.net/zgy666/article/details/110704368)，参数：net.ipv4.tcp_fastopen
  * 第一次建立tcp连接，客户端将服务端给的cookie存入hash表tcp_metrics_hash，接着该连接断开
  * 第二次直接发送数据，在第一个sync包里携带data数据+cookie，服务端直接将data数据放入socket的接收队列
  * [图示](../images/fast-open.png)
* [糊涂窗口综合症和Nagle算法](https://developer.aliyun.com/article/41930)
* 糊涂窗口综合征(SWS)：每次数据包只有少量有效载荷
* 发送端引起的SWS：
  * 用户态每次只write一个字节
  * 解决：Nagle算法，延迟发送
* 接收端引起的SWS：
  * 用户态每次只read一个字节，导致接收缓冲区只有一字节窗口
  * 解决1：Clark算法，接收窗口<MSS则直接告知窗口为0
  * 解决2：延迟确认
* Nagle算法，[代码](https://elixir.bootlin.com/linux/v5.19/source/net/ipv4/tcp_output.c#L1946)
  * 4.14之前可以设置net.ipv4.tcp_low_latency=1关闭，或者设置TCP_NODELAY
  * 如果包长度达到 MSS ，则允许发送；
  * 如果该包含有 FIN ，则允许发送；
  * 如果设置了 TCP_NODELAY 选项，则允许发送；
  * 如果所有发出去的小数据包（包长度小于 MSS ）均被确认，则允许发送；
  * 上述条件都未满足，但发生了超时（一般为 200ms），则立即发送。
* 延迟确认：通过设置TCP_QUICKACK关闭
  * 当有响应数据要发送时，ACK 会随着响应数据一起立刻发送给对方
  * 当对方的第二个数据报文又到达了，这时就会立刻发送 ACK
  * 上述条件都未满足，但发生了超时（一般为 40ms），则立即发送。

#### 4.4 TCP全连接队列和半连接队列
* [TCP Socket Listen: A Tale of Two Queues](http://arthurchiao.art/blog/tcp-listen-a-tale-of-two-queues/)
* ss命令查看TCP socket
  * 若是LISTEN 状态，Recv-Q/Send-Q表示未被accept的个数/全连接的长度
  * 若是非LISTEN 状态，Recv-Q/Send-Q表示已接收未被应用层读取的字节/表示已发送未被ack的字节
* 2.6.30源码、5.0.0源码










