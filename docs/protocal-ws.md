### websocket协议

#### 参考文章
* [rfc 6455](https://www.rfc-editor.org/rfc/rfc6455)
* [既然有 HTTP 协议，为什么还要有 WebSocket？](https://xiaolincoding.com/network/2_http/http_websocket.html)

```
      0                   1                   2                   3
      0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
     +-+-+-+-+-------+-+-------------+-------------------------------+
     |F|R|R|R| opcode|M| Payload len |    Extended payload length    |
     |I|S|S|S|  (4)  |A|     (7)     |             (16/64)           |
     |N|V|V|V|       |S|             |   (if payload len==126/127)   |
     | |1|2|3|       |K|             |                               |
     +-+-+-+-+-------+-+-------------+ - - - - - - - - - - - - - - - +
     |     Extended payload length continued, if payload len == 127  |
     + - - - - - - - - - - - - - - - +-------------------------------+
     |                               |Masking-key, if MASK set to 1  |
     +-------------------------------+-------------------------------+
     | Masking-key (continued)       |          Payload Data         |
     +-------------------------------- - - - - - - - - - - - - - - - +
     :                     Payload Data continued ...                :
     + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +
     |                     Payload Data continued ...                |
     +---------------------------------------------------------------+

FIN:             分片时FIN=1表示最后一个frame
RSV:             保留字段
Opcode:          4 bits
                 %x0 denotes a continuation frame
                 %x1 denotes a text frame
                 %x2 denotes a binary frame
                 %x3-7 are reserved for further non-control frames
                 %x8 denotes a connection close
                 %x9 denotes a ping
                 %xA denotes a pong
Mask:            If set to 1, a  masking key is present in masking-key, 
                 and this is used to unmask the "Payload data"
Payload length:  7 bits, 7+16 bits, or 7+64 bits, The length of the "Payload data"
                 如果前7字节<126，7 bits
                 如果前7字节=126，7+16 bits
                 如果前7字节=127，7+64 bits
Masking-key:     0 or 4 bytes, This field is present if Mask = 1
Payload data:    数据
```

#### 如果注意两个场景
* [分片](https://www.rfc-editor.org/rfc/rfc6455.html#section-5.4)：假设有数据需要分成3个frame
  * 第1个frame，FIN=0，Opcode=1
  * 第2个frame，FIN=0，Opcode=0
  * 第3个frame，FIN=1，Opcode=0
* [掩码](https://www.rfc-editor.org/rfc/rfc6455.html#section-5.3)：Client-to-Server Masking
  * 客户端：Mask必须是1
  * 服务端：Mask必须是0


