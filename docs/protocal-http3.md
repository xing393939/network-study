### http3协议

#### 参考文章
* [RFC HTTP/3](https://www.rfc-editor.org/rfc/rfc9114.html)
* [RFC QUIC](https://www.rfc-editor.org/rfc/rfc9000.html)
* [RFC Using TLS to Secure QUIC](https://www.rfc-editor.org/rfc/rfc9001.html)

![img](../images/struct-http3-layers.png)

```
// 用于首次建立连接
QUIC Long Header Packet {
  Header Form (1) = 1,                  // 固定是1
  Fixed Bit (1) = 1,                    // 固定是1
  Long Packet Type (2),                 // 0~3依次是Initial/0-RTT/Handshake/Retry
  Type-Specific Bits (4),
  Version (32),
  Destination Connection ID Length (8), // Dst Connection ID length
  Destination Connection ID (0..160),   // Dst Connection ID
  Source Connection ID Length (8),      // Src Connection ID length
  Source Connection ID (0..160),        // Src Connection ID
  Type-Specific Payload (..),
}

// 用于日常传输数据
QUIC Short Header Packets {
  Header Form (1) = 0,                // 固定是0
  Fixed Bit (1) = 1,                  // 固定是1
  Spin Bit (1),                       // enables passive latency monitoring
  Reserved Bits (2),
  Key Phase (1),                      // 0无tls，1有tls
  Packet Number Length (2),           // Packet Number Length
  Destination Connection ID (0..160), // Dst Connection ID
  Packet Number (8..32),              // Packet Number
  Packet Payload (8..),               // Packet Payload
}

QUIC Frame {
  Frame Type (i),             // 详见https://www.rfc-editor.org/rfc/rfc9000.html#name-frames-and-frame-types
  Type-Dependent Fields (..),
}

HTTP/3 Frame Format {
  Type (i),           // 0/1/3/4/5/7/13分别是DATA/HEADERS/CANCEL_PUSH/SETTINGS/PUSH_PROMISE/GOAWAY/MAX_PUSH_ID
  Length (i),         // Frame Payload length
  Frame Payload (..), // Frame Payload
}
```


![img](../images/http-versions.png)
