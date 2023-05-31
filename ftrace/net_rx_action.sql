1058985.565749 |   5)    <idle>-0    |               |  net_rx_action() {
1058985.565750 |   5)    <idle>-0    |   0.955 us    |    __usecs_to_jiffies();
1058985.565752 |   5)    <idle>-0    |               |    __napi_poll() {
1058985.565753 |   5)    <idle>-0    |               |      e1000e_poll [e1000e]() {
1058985.565754 |   5)    <idle>-0    |   1.457 us    |        e1000_clean_tx_irq [e1000e]();
1058985.565756 |   5)    <idle>-0    |               |        e1000_clean_rx_irq [e1000e]() {
1058985.565758 |   5)    <idle>-0    |   1.216 us    |          dma_unmap_page_attrs();
1058985.565760 |   5)    <idle>-0    |               |          __napi_alloc_skb() {
1058985.565761 |   5)    <idle>-0    |               |            __alloc_skb() {
1058985.565762 |   5)    <idle>-0    |   0.910 us    |              napi_skb_cache_get();
1058985.565763 |   5)    <idle>-0    |               |              kmalloc_reserve() {
1058985.565764 |   5)    <idle>-0    |               |                __kmalloc_node_track_caller() {
1058985.565765 |   5)    <idle>-0    |   0.759 us    |                  kmalloc_slab();
1058985.565766 |   5)    <idle>-0    |   0.715 us    |                  should_failslab();
1058985.565768 |   5)    <idle>-0    |   4.465 us    |                }
1058985.565770 |   5)    <idle>-0    |   6.908 us    |              }
1058985.565771 |   5)    <idle>-0    |               |              ksize() {
1058985.565771 |   5)    <idle>-0    |   0.829 us    |                kfence_ksize();
1058985.565774 |   5)    <idle>-0    |   1.141 us    |                __ksize();
1058985.565774 |   5)    <idle>-0    |   3.962 us    |              }
1058985.565775 |   5)    <idle>-0    |   0.723 us    |              __build_skb_around();
1058985.565776 |   5)    <idle>-0    | + 15.608 us   |            }
1058985.565777 |   5)    <idle>-0    | + 16.997 us   |          }
1058985.565778 |   5)    <idle>-0    |   0.733 us    |          skb_put();
1058985.565779 |   5)    <idle>-0    |   0.716 us    |          e1000_rx_checksum [e1000e]();
1058985.565781 |   5)    <idle>-0    |               |          e1000_receive_skb [e1000e]() {
1058985.565781 |   5)    <idle>-0    |   0.923 us    |            eth_type_trans();
1058985.565783 |   5)    <idle>-0    |               |            napi_gro_receive() {
1058985.565784 |   5)    <idle>-0    |               |              dev_gro_receive() {
1058985.565785 |   5)    <idle>-0    |   0.757 us    |                gro_list_prepare();
1058985.565786 |   5)    <idle>-0    |   0.718 us    |                __rcu_read_lock();
1058985.565788 |   5)    <idle>-0    |               |                inet_gro_receive() {
1058985.565789 |   5)    <idle>-0    |               |                  tcp4_gro_receive() {
1058985.565790 |   5)    <idle>-0    |   0.922 us    |                    tcp_gro_receive();
1058985.565792 |   5)    <idle>-0    |   3.608 us    |                  }
1058985.565793 |   5)    <idle>-0    |   5.188 us    |                }
1058985.565793 |   5)    <idle>-0    |   0.691 us    |                __rcu_read_unlock();
1058985.565795 |   5)    <idle>-0    | + 11.106 us   |              }
1058985.565795 |   5)    <idle>-0    | + 12.593 us   |            }
1058985.565796 |   5)    <idle>-0    | + 15.478 us   |          }
1058985.565797 |   5)    <idle>-0    |               |          e1000_alloc_rx_buffers [e1000e]() {
1058985.565798 |   5)    <idle>-0    |   0.974 us    |            skb_trim();
1058985.565799 |   5)    <idle>-0    |   0.732 us    |            is_vmalloc_addr();
1058985.565801 |   5)    <idle>-0    |   1.188 us    |            dma_map_page_attrs();
1058985.565803 |   5)    <idle>-0    |   5.909 us    |          }
1058985.565803 |   5)    <idle>-0    | + 47.049 us   |        }
1058985.565804 |   5)    <idle>-0    |               |        napi_complete_done() {
1058985.565805 |   5)    <idle>-0    |               |          netif_receive_skb_list_internal() {
1058985.565806 |   5)    <idle>-0    |   0.853 us    |            skb_defer_rx_timestamp();
1058985.565807 |   5)    <idle>-0    |   0.716 us    |            __rcu_read_lock();
1058985.565809 |   5)    <idle>-0    |               |            __netif_receive_skb_list_core() {
1058985.565809 |   5)    <idle>-0    |   1.398 us    |              __netif_receive_skb_core.constprop.0();
1058985.565812 |   5)    <idle>-0    |               |              ip_list_rcv() {
1058985.565812 |   5)    <idle>-0    |   0.947 us    |                ip_rcv_core();
1058985.565814 |   5)    <idle>-0    |               |                ip_sublist_rcv() {
1058985.565815 |   5)    <idle>-0    |   1.033 us    |                  __rcu_read_lock();
1058985.565817 |   5)    <idle>-0    |               |                  nf_hook_slow_list() {
1058985.565818 |   5)    <idle>-0    |               |                    nf_hook_slow() {
1058985.565960 |   5)    <idle>-0    |               |                      /* bpf_trace_printk: 6010 > 8100 */
1058985.565966 |   5)    <idle>-0    |   1.136 us    |                      ip_sabotage_in [br_netfilter]();
1058985.565968 |   5)    <idle>-0    |   1.070 us    |                      ipv4_conntrack_defrag [nf_defrag_ipv4]();
1058985.565970 |   5)    <idle>-0    |               |                      ipv4_conntrack_in [nf_conntrack]() {
1058985.565971 |   5)    <idle>-0    |               |                        nf_conntrack_in [nf_conntrack]() {
1058985.565972 |   5)    <idle>-0    |   1.141 us    |                          get_l4proto [nf_conntrack]();
1058985.565976 |   5)    <idle>-0    |               |                          resolve_normal_ct [nf_conntrack]() {
1058985.565976 |   5)    <idle>-0    |               |                            nf_ct_get_tuple [nf_conntrack]() {
1058985.565977 |   5)    <idle>-0    |   1.066 us    |                              nf_ct_get_tuple_ports.constprop.0 [nf_conntrack]();
1058985.565979 |   5)    <idle>-0    |   3.224 us    |                            }
1058985.565980 |   5)    <idle>-0    |   1.329 us    |                            hash_conntrack_raw [nf_conntrack]();
1058985.565982 |   5)    <idle>-0    |               |                            __nf_conntrack_find_get [nf_conntrack]() {
1058985.565983 |   5)    <idle>-0    |   1.052 us    |                              __rcu_read_lock();
1058985.565985 |   5)    <idle>-0    |   1.083 us    |                              __rcu_read_unlock();
1058985.565987 |   5)    <idle>-0    |   5.476 us    |                            }
1058985.565988 |   5)    <idle>-0    | + 13.756 us   |                          }
1058985.565989 |   5)    <idle>-0    |               |                          nf_conntrack_handle_packet [nf_conntrack]() {
1058985.565990 |   5)    <idle>-0    |               |                            nf_conntrack_tcp_packet [nf_conntrack]() {
1058985.565991 |   5)    <idle>-0    |               |                              nf_checksum() {
1058985.565993 |   5)    <idle>-0    |   1.381 us    |                                nf_ip_checksum();
1058985.565995 |   5)    <idle>-0    |   3.452 us    |                              }
1058985.565996 |   5)    <idle>-0    |   1.772 us    |                              _raw_spin_lock_bh();
1058985.565999 |   5)    <idle>-0    |               |                              tcp_in_window [nf_conntrack]() {
1058985.566000 |   5)    <idle>-0    |   0.812 us    |                                nf_ct_seq_offset [nf_conntrack]();
1058985.566002 |   5)    <idle>-0    |   2.971 us    |                              }
1058985.566003 |   5)    <idle>-0    |               |                              _raw_spin_unlock_bh() {
1058985.566004 |   5)    <idle>-0    |   1.089 us    |                                __local_bh_enable_ip();
1058985.566006 |   5)    <idle>-0    |   2.903 us    |                              }
1058985.566007 |   5)    <idle>-0    |               |                              __nf_ct_refresh_acct [nf_conntrack]() {
1058985.566009 |   5)    <idle>-0    |   0.813 us    |                                nf_ct_acct_add [nf_conntrack]();
1058985.566010 |   5)    <idle>-0    |   3.465 us    |                              }
1058985.566012 |   5)    <idle>-0    | + 21.636 us   |                            }
1058985.566013 |   5)    <idle>-0    | + 23.711 us   |                          }
1058985.566013 |   5)    <idle>-0    | + 42.704 us   |                        }
1058985.566014 |   5)    <idle>-0    | + 44.625 us   |                      }
1058985.566016 |   5)    <idle>-0    |               |                      nf_nat_ipv4_pre_routing [nf_nat]() {
1058985.566017 |   5)    <idle>-0    |   1.186 us    |                        nf_nat_inet_fn [nf_nat]();
1058985.566019 |   5)    <idle>-0    |   3.194 us    |                      }
1058985.566019 |   5)    <idle>-0    | ! 201.742 us  |                    }
1058985.566020 |   5)    <idle>-0    | ! 203.516 us  |                  }
1058985.566021 |   5)    <idle>-0    |   1.046 us    |                  __rcu_read_unlock();
1058985.566023 |   5)    <idle>-0    |               |                  ip_rcv_finish_core.constprop.0() {
1058985.566025 |   5)    <idle>-0    |               |                    tcp_v4_early_demux() {
1058985.566026 |   5)    <idle>-0    |               |                      __inet_lookup_established() {
1058985.566027 |   5)    <idle>-0    |   1.007 us    |                        inet_ehashfn();
1058985.566029 |   5)    <idle>-0    |   3.713 us    |                      }
1058985.566032 |   5)    <idle>-0    |   1.377 us    |                      ipv4_dst_check();
1058985.566033 |   5)    <idle>-0    |   8.375 us    |                    }
1058985.566035 |   5)    <idle>-0    | + 11.430 us   |                  }
1058985.566036 |   5)    <idle>-0    |               |                  ip_sublist_rcv_finish() {
1058985.566037 |   5)    <idle>-0    |               |                    ip_local_deliver() {
1058985.566038 |   5)    <idle>-0    |   1.193 us    |                      __rcu_read_lock();
1058985.566040 |   5)    <idle>-0    |               |                      nf_hook_slow() {
1058985.566183 |   5)    <idle>-0    |               |                        /* bpf_trace_printk: 6010 > 8100 */
1058985.566188 |   5)    <idle>-0    |               |                        nf_nat_ipv4_local_in [nf_nat]() {
1058985.566189 |   5)    <idle>-0    |   1.030 us    |                          nf_nat_inet_fn [nf_nat]();
1058985.566191 |   5)    <idle>-0    |   2.895 us    |                        }
1058985.566192 |   5)    <idle>-0    |               |                        ipv4_confirm [nf_conntrack]() {
1058985.566193 |   5)    <idle>-0    |   1.074 us    |                          nf_confirm [nf_conntrack]();
1058985.566194 |   5)    <idle>-0    |   2.724 us    |                        }
1058985.566195 |   5)    <idle>-0    | ! 154.843 us  |                      }
1058985.566196 |   5)    <idle>-0    |   1.069 us    |                      __rcu_read_unlock();
1058985.566198 |   5)    <idle>-0    |               |                      ip_local_deliver_finish() {
1058985.566199 |   5)    <idle>-0    |   0.926 us    |                        __rcu_read_lock();
1058985.566201 |   5)    <idle>-0    |               |                        ip_protocol_deliver_rcu() {
1058985.566202 |   5)    <idle>-0    |               |                          raw_local_deliver() {
1058985.566203 |   5)    <idle>-0    |               |                            raw_v4_input() {
1058985.566205 |   5)    <idle>-0    |   1.036 us    |                              __rcu_read_lock();
1058985.566207 |   5)    <idle>-0    |   1.051 us    |                              __rcu_read_unlock();
1058985.566208 |   5)    <idle>-0    |   5.078 us    |                            }
1058985.566209 |   5)    <idle>-0    |   6.781 us    |                          }
1058985.566210 |   5)    <idle>-0    |               |                          tcp_v4_rcv() {
1058985.566212 |   5)    <idle>-0    |               |                            tcp_inbound_md5_hash() {
1058985.566213 |   5)    <idle>-0    |   1.036 us    |                              tcp_parse_md5sig_option();
1058985.566215 |   5)    <idle>-0    |   2.976 us    |                            }
1058985.566216 |   5)    <idle>-0    |               |                            tcp_filter() {
1058985.566217 |   5)    <idle>-0    |               |                              sk_filter_trim_cap() {
1058985.566219 |   5)    <idle>-0    |               |                                security_sock_rcv_skb() {
1058985.566220 |   5)    <idle>-0    |   1.038 us    |                                  apparmor_socket_sock_rcv_skb();
1058985.566222 |   5)    <idle>-0    |   3.117 us    |                                }
1058985.566223 |   5)    <idle>-0    |   1.054 us    |                                __rcu_read_lock();
1058985.566225 |   5)    <idle>-0    |   1.040 us    |                                __rcu_read_unlock();
1058985.566226 |   5)    <idle>-0    |   9.476 us    |                              }
1058985.566227 |   5)    <idle>-0    | + 11.338 us   |                            }
1058985.566228 |   5)    <idle>-0    |   1.038 us    |                            tcp_v4_fill_cb();
1058985.566230 |   5)    <idle>-0    |   1.068 us    |                            _raw_spin_lock();
1058985.566232 |   5)    <idle>-0    |               |                            tcp_v4_do_rcv() {
1058985.566234 |   5)    <idle>-0    |   1.116 us    |                              ipv4_dst_check();
1058985.566235 |   5)    <idle>-0    |               |                              tcp_rcv_established() {
1058985.566236 |   5)    <idle>-0    |               |                                tcp_mstamp_refresh() {
1058985.566238 |   5)    <idle>-0    |   1.183 us    |                                  ktime_get();
1058985.566239 |   5)    <idle>-0    |   3.081 us    |                                }
1058985.566241 |   5)    <idle>-0    |   1.615 us    |                                tcp_validate_incoming();
1058985.566243 |   5)    <idle>-0    |               |                                tcp_ack() {
1058985.566244 |   5)    <idle>-0    |   1.056 us    |                                  ktime_get_seconds();
1058985.566247 |   5)    <idle>-0    |   3.676 us    |                                }
1058985.566248 |   5)    <idle>-0    |   1.103 us    |                                tcp_urg();
1058985.566250 |   5)    <idle>-0    |               |                                tcp_data_queue() {
1058985.566251 |   5)    <idle>-0    |               |                                  sk_forced_mem_schedule() {
1058985.566252 |   5)    <idle>-0    |               |                                    mem_cgroup_charge_skmem() {
1058985.566253 |   5)    <idle>-0    |               |                                      try_charge_memcg() {
1058985.566254 |   5)    <idle>-0    |   1.114 us    |                                        consume_stock();
1058985.566256 |   5)    <idle>-0    |   1.065 us    |                                        do_memsw_account();
1058985.566258 |   5)    <idle>-0    |               |                                        page_counter_try_charge() {
1058985.566260 |   5)    <idle>-0    |   1.077 us    |                                          propagate_protected_usage();
1058985.566262 |   5)    <idle>-0    |   1.032 us    |                                          propagate_protected_usage();
1058985.566264 |   5)    <idle>-0    |   1.017 us    |                                          propagate_protected_usage();
1058985.566266 |   5)    <idle>-0    |   1.004 us    |                                          propagate_protected_usage();
1058985.566267 |   5)    <idle>-0    |   9.261 us    |                                        }
1058985.566269 |   5)    <idle>-0    |               |                                        refill_stock() {
1058985.566270 |   5)    <idle>-0    |               |                                          __refill_stock() {
1058985.566271 |   5)    <idle>-0    |               |                                            drain_stock() {
1058985.566272 |   5)    <idle>-0    |               |                                              page_counter_uncharge() {
1058985.566273 |   5)    <idle>-0    |               |                                                page_counter_cancel() {
1058985.566274 |   5)    <idle>-0    |   1.085 us    |                                                  propagate_protected_usage();
1058985.566276 |   5)    <idle>-0    |   3.175 us    |                                                }
1058985.566277 |   5)    <idle>-0    |               |                                                page_counter_cancel() {
1058985.566278 |   5)    <idle>-0    |   1.052 us    |                                                  propagate_protected_usage();
1058985.566280 |   5)    <idle>-0    |   3.081 us    |                                                }
1058985.566281 |   5)    <idle>-0    |               |                                                page_counter_cancel() {
1058985.566282 |   5)    <idle>-0    |   1.000 us    |                                                  propagate_protected_usage();
1058985.566284 |   5)    <idle>-0    |   2.950 us    |                                                }
1058985.566285 |   5)    <idle>-0    |               |                                                page_counter_cancel() {
1058985.566287 |   5)    <idle>-0    |   1.011 us    |                                                  propagate_protected_usage();
1058985.566288 |   5)    <idle>-0    |   2.885 us    |                                                }
1058985.566289 |   5)    <idle>-0    |               |                                                page_counter_cancel() {
1058985.566290 |   5)    <idle>-0    |   1.032 us    |                                                  propagate_protected_usage();
1058985.566291 |   5)    <idle>-0    |   2.914 us    |                                                }
1058985.566292 |   5)    <idle>-0    | + 20.310 us   |                                              }
1058985.566293 |   5)    <idle>-0    |   1.031 us    |                                              do_memsw_account();
1058985.566295 |   5)    <idle>-0    |   1.055 us    |                                              __rcu_read_lock();
1058985.566297 |   5)    <idle>-0    |   0.982 us    |                                              __rcu_read_unlock();
1058985.566299 |   5)    <idle>-0    | + 27.860 us   |                                            }
1058985.566300 |   5)    <idle>-0    |   0.995 us    |                                            __rcu_read_lock();
1058985.566302 |   5)    <idle>-0    |   1.041 us    |                                            __rcu_read_unlock();
1058985.566304 |   5)    <idle>-0    | + 33.984 us   |                                          }
1058985.566304 |   5)    <idle>-0    | + 35.925 us   |                                        }
1058985.566306 |   5)    <idle>-0    | + 52.423 us   |                                      }
1058985.566307 |   5)    <idle>-0    |               |                                      __mod_memcg_state() {
1058985.566308 |   5)    <idle>-0    |               |                                        cgroup_rstat_updated() {
1058985.566310 |   5)    <idle>-0    |   1.120 us    |                                          _raw_spin_lock_irqsave();
1058985.566312 |   5)    <idle>-0    |   1.044 us    |                                          _raw_spin_unlock_irqrestore();
1058985.566314 |   5)    <idle>-0    |   6.139 us    |                                        }
1058985.566315 |   5)    <idle>-0    |   8.403 us    |                                      }
1058985.566316 |   5)    <idle>-0    | + 63.687 us   |                                    }
1058985.566317 |   5)    <idle>-0    | + 65.742 us   |                                  }
1058985.566318 |   5)    <idle>-0    |   1.218 us    |                                  tcp_queue_rcv();
1058985.566320 |   5)    <idle>-0    |               |                                  tcp_fin() {
1058985.566321 |   5)    <idle>-0    |               |                                    tcp_set_state() {
1058985.566323 |   5)    <idle>-0    |   1.064 us    |                                      inet_sk_state_store();
1058985.566324 |   5)    <idle>-0    |   3.257 us    |                                    }
1058985.566325 |   5)    <idle>-0    |   1.241 us    |                                    skb_rbtree_purge();
1058985.566328 |   5)    <idle>-0    |               |                                    sock_def_wakeup() {
1058985.566329 |   5)    <idle>-0    |   1.069 us    |                                      __rcu_read_lock();
1058985.566331 |   5)    <idle>-0    |   1.014 us    |                                      __rcu_read_unlock();
1058985.566333 |   5)    <idle>-0    |   5.073 us    |                                    }
1058985.566334 |   5)    <idle>-0    | + 14.168 us   |                                  }
1058985.566335 |   5)    <idle>-0    |               |                                  tcp_data_ready() {
1058985.566336 |   5)    <idle>-0    |               |                                    sock_def_readable() {
1058985.566337 |   5)    <idle>-0    |   1.042 us    |                                      __rcu_read_lock();
1058985.566340 |   5)    <idle>-0    |   1.044 us    |                                      __rcu_read_unlock();
1058985.566341 |   5)    <idle>-0    |   4.909 us    |                                    }
1058985.566342 |   5)    <idle>-0    |   6.928 us    |                                  }
1058985.566343 |   5)    <idle>-0    | + 93.235 us   |                                }
1058985.566344 |   5)    <idle>-0    |               |                                __tcp_ack_snd_check() {
1058985.566345 |   5)    <idle>-0    |               |                                  tcp_send_delayed_ack() {
1058985.566347 |   5)    <idle>-0    |               |                                    sk_reset_timer() {
1058985.566348 |   5)    <idle>-0    |               |                                      mod_timer() {
1058985.566349 |   5)    <idle>-0    |               |                                        lock_timer_base() {
1058985.566350 |   5)    <idle>-0    |   1.025 us    |                                          _raw_spin_lock_irqsave();
1058985.566352 |   5)    <idle>-0    |   2.993 us    |                                        }
1058985.566353 |   5)    <idle>-0    |   1.051 us    |                                        detach_if_pending();
1058985.566355 |   5)    <idle>-0    |               |                                        get_nohz_timer_target() {
1058985.566356 |   5)    <idle>-0    |   1.031 us    |                                          housekeeping_cpumask();
1058985.566358 |   5)    <idle>-0    |   1.066 us    |                                          __rcu_read_lock();
1058985.566360 |   5)    <idle>-0    |   1.053 us    |                                          __rcu_read_unlock();
1058985.566362 |   5)    <idle>-0    |   7.294 us    |                                        }
1058985.566364 |   5)    <idle>-0    |   1.122 us    |                                        _raw_spin_unlock();
1058985.566366 |   5)    <idle>-0    |   1.761 us    |                                        _raw_spin_lock();
1058985.566368 |   5)    <idle>-0    |   0.848 us    |                                        calc_wheel_index();
1058985.566370 |   5)    <idle>-0    |   1.037 us    |                                        enqueue_timer();
1058985.566371 |   5)    <idle>-0    |   0.849 us    |                                        _raw_spin_unlock_irqrestore();
1058985.566373 |   5)    <idle>-0    | + 25.426 us   |                                      }
1058985.566374 |   5)    <idle>-0    | + 27.715 us   |                                    }
1058985.566375 |   5)    <idle>-0    | + 29.831 us   |                                  }
1058985.566376 |   5)    <idle>-0    | + 32.304 us   |                                }
1058985.566378 |   5)    <idle>-0    | ! 142.333 us  |                              }
1058985.566378 |   5)    <idle>-0    | ! 146.465 us  |                            }
1058985.566380 |   5)    <idle>-0    |   1.234 us    |                            _raw_spin_unlock();
1058985.566381 |   5)    <idle>-0    | ! 171.280 us  |                          }
1058985.566382 |   5)    <idle>-0    | ! 181.647 us  |                        }
1058985.566383 |   5)    <idle>-0    |   0.881 us    |                        __rcu_read_unlock();
1058985.566385 |   5)    <idle>-0    | ! 187.083 us  |                      }
1058985.566386 |   5)    <idle>-0    | ! 349.008 us  |                    }
1058985.566387 |   5)    <idle>-0    | ! 351.070 us  |                  }
1058985.566387 |   5)    <idle>-0    | ! 573.476 us  |                }
1058985.566388 |   5)    <idle>-0    | ! 576.782 us  |              }
1058985.566389 |   5)    <idle>-0    | ! 580.636 us  |            }
1058985.566390 |   5)    <idle>-0    |   1.081 us    |            __rcu_read_unlock();
1058985.566392 |   5)    <idle>-0    | ! 587.068 us  |          }
1058985.566393 |   5)    <idle>-0    | ! 588.792 us  |        }
1058985.566394 |   5)    <idle>-0    |   1.101 us    |        e1000_update_itr [e1000e]();
1058985.566397 |   5)    <idle>-0    |   1.259 us    |        e1000_update_itr [e1000e]();
1058985.566399 |   5)    <idle>-0    |   2.682 us    |        e1000_irq_enable [e1000e]();
1058985.566402 |   5)    <idle>-0    | ! 648.795 us  |      }
1058985.566403 |   5)    <idle>-0    | ! 650.635 us  |    }
1058985.566404 |   5)    <idle>-0    | ! 655.938 us  |  }