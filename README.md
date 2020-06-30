# um2020001

友盟统计 flutter 插件 

## Getting Started

友盟统计插件

## 初始化

 ```
    ///友盟的初始化
    ///参数一 appkey
    ///参数二 推送使用的pushSecret
    ///参数三 是否打开调试日志
    FlutterFaiUmeng.uMengInit("",
        pushSecret: "", logEnabled: true);

    /// 监听原生消息
    FlutterFaiUmeng.receiveMessage((message) {
      print(message);
      setState(() {
        _result = message.toString();
      });
    });
```


export http_proxy=sock