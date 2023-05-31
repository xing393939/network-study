### 网络包接收

![img](../images/network-recv.png)

```
系统调用入口: sys_sendto
协议栈入口: sock->ops->sendmsg，AF_INET协议族是inet_sendmsg
传输层入口: sk->sk_prot->sendmsg，tcp是tcp_sendmsg
网络层入口: icsk->icsk_af_ops->queue_xmit，即是ip_queue_xmit
邻居系统入口: neigh_output
网络设备入口: dev_queue_xmit
驱动程序入口: dev->netdev_opsndo_start_xmit，可能是：
            e1000_xmit_frame
            igb_xmit_frame
```


