### 网络包发送

![img](../images/network-send.png)

```
系统调用入口：sys_sendto
协议栈入口：sock->ops->sendmsg，即是AF_INET协议族的inet_sendmsg
传输层入口：sk->sk_prot->sendmsg，tcp即是tcp_sendmsg
网络层入口：icsk->icsk_af_ops->queue_xmit，即是ip_queue_xmit
邻居系统入口：neigh_output
链路层入口：dev_queue_xmit
驱动程序入口：dev_hard_start_xmit
```





