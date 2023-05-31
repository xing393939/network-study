### 网络包发送

![img](../images/network-send.png)

```
系统调用入口：sys_sendto
协议栈入口：sock->ops->sendmsg，即是AF_INET协议族的inet_sendmsg
传输层入口：sk->sk_prot->sendmsg，tcp即是tcp_sendmsg
网络层入口：icsk->icsk_af_ops->queue_xmit，即是ip_queue_xmit
邻居系统入口：neigh_output
网络设备入口：dev_queue_xmit、dev_hard_start_xmit
驱动程序入口：
```

#### 执行netfilter：OUTPUT、POSTOUTPUT链
```
// 在网络层
ip_queue_xmit() {
  __ip_queue_xmit() {
    ip_local_out() {
      __ip_local_out() {
        nf_hook(NFPROTO_IPV4, NF_INET_LOCAL_OUT, ...)
      }
      ip_output() {
        NF_HOOK_COND(NFPROTO_IPV4, NF_INET_POST_ROUTING, ...)
      }
    }
  }
}
```

#### 执行tcpdump
```
// 在网络设备层
dev_hard_start_xmit() {
  xmit_one(skb, dev, ...) {
    dev_queue_xmit_nit(skb, dev) {
      list_for_each_entry_rcu(ptype, ptype_list, list) {
        deliver_skb(skb2, pt_prev, skb->dev); // 执行 tcpdump 挂在上面的虚拟协议
      }
    }
  }
}
```


