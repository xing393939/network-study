### 图解网络

#### 参考资料
* [图解网络](https://xiaolincoding.com/network/)

#### 键入网址到网页显示，期间发生了什么
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


