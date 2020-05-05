### 入口文件public/index.php分析

1. 创建服务容器$app，单例绑定Http、Console、Exceptions服务
 1. registerBaseBindings()，instance绑定Container，单例绑定Mix、PackageManifest
 1. registerBaseServiceProviders()，三大基础服务：Event、Log、Routing
 1. registerCoreContainerAliases()，注册别名：如app、auth、cache、config、cookie、db、events、files、log、redis、session
1. Http服务：生成Request和Response，执行$response->send()
1. Http服务：terminate()收尾工作，中间件、容器的收尾工作


