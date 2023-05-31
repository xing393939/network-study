### nf五链四表

#### 参考资料
* [netfilter的四表五链概述](https://blog.csdn.net/angelqucheng/article/details/90032897)
* 五链：五个链也分别被形象的称为五个钩子（hook）函数
  * INPUT链——进入本地的数据包应用此规则链中的策略；
  * OUTPUT链——流出本地的数据包应用此规则链中的策略；
  * FORWARD链——转发数据包时应用此规则链中的策略；
  * PREROUTING链——对数据包作路由选择前应用此链中的规则；
  * POSTROUTING链——对数据包作路由选择后（包含流出本地的二次路由）应用此链中的规则；
* 四表：
  * Filter表——涉及FORWARD、INPUT、OUTPUT三条链，多用于本地和转发过程中数据过滤；
  * Nat表——涉及PREROUTING、OUTPUT、POSTROUT三条链，多用于源地址/端口转换和目标地址/端口的转换；
  * Mangle表——涉及整条链，可实现拆解报文、修改报文、重新封装，可常见于IPVS的PPC下多端口会话保持。
  * Raw表——涉及PREROUTING和OUTPUT链，决定数据包是否被状态跟踪机制处理，需关闭nat表上的连接追踪机制。




