### 网络包接收

![img](../images/network-recv.png)

```
硬中断入口: e1000_intr或igb_msix_ring
软中断入口: ksoftirqd_should_run
驱动程序入口: n->poll，即是e1000e_poll或igb_poll
网络设备入口: netif_receive_skb_list_internal
网络层入口: pt_prev->func，即是ip_list_rcv
传输层入口: ipprot->handle，即是tcp_v4_rcv
```


