### nf五链四表

#### 参考资料
* [netfilter的四表五链概述](https://blog.csdn.net/angelqucheng/article/details/90032897)
* 五链：五个链也分别被形象的称为五个钩子（hook）函数
  * INPUT链——进来的数据包应用此规则链中的策略
  * OUTPUT链——外出的数据包应用此规则链中的策略
  * FORWARD链——转发数据包时应用此规则链中的策略
  * PREROUTING链——对数据包作路由选择前应用此链中的规则（所有的数据包进来的时侯都先由这个链处理）
  * POSTROUTING链——对数据包作路由选择后应用此链中的规则（所有的数据包出来的时侯都先由这个链处理）
* 四表：
  * Filter表——涉及FORWARD、INPUT、OUTPUT三条链，过滤数据包
  * Nat表—————涉及PREROUTING、OUTPUT、POSTROUT三条链，用于网络地址转换（IP、端口）
  * Mangle表——涉及整条链，可修改数据包的服务类型、TTL、并且可以配置路由实现QOS
  * Raw表—————涉及PREROUTING、OUTPUT链，决定数据包是否被状态跟踪机制处理，需关闭nat表上的连接追踪机制。

![img](../images/nfk-tracersal.jpg)



