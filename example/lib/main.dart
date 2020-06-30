import 'package:flutter/material.dart';
import 'package:flutter_fai_upgrade/flutter_fai_upgrade.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _result = '暂无数据';

  @override
  void initState() {
    super.initState();

    ///友盟的初始化
    ///参数一 appkey
    ///参数二 推送使用的pushSecret
    ///参数三 是否打开调试日志
    FlutterFaiUpgrade.uMengInit("5ee8cba0dbc2ec081340b58a",
        pushSecret: "e04c4181f34de9eb3a60e815c233d41f", logEnabled: true);

    /// 监听原生消息
    FlutterFaiUpgrade.receiveMessage((message) {
      print(message);
      setState(() {
        _result = message.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('测试友盟统计 '),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                FlutterFaiUpgrade.uMengPageStart("测试页面1");
              },
              child: Text("统计页面进入"),
            ),
            FlatButton(
              onPressed: () {
                FlutterFaiUpgrade.uMengPageEnd("测试页面1");
              },
              child: Text("统计页面结束"),
            ),
            FlatButton(
              onPressed: () {
                FlutterFaiUpgrade.uMengEventClick("login");
              },
              child: Text("统计按钮点击事件"),
            ),
            FlatButton(
              onPressed: () {
                var falg = 1 / 0;
              },
              child: Text("测试异常"),
            ),
            FlatButton(
              onPressed: () {
                FlutterFaiUpgrade.uMengError("有错误了");
              },
              child: Text("测试异常上报"),
            ),
            FlatButton(
              onPressed: () async {
                var result = await FlutterFaiUpgrade.pushInit();
                setState(() {
                  _result = result['result'].toString();
                });
              },
              child: Text('注册通知'),
            ),
            FlatButton(
              onPressed: () async {
                var result =
                    await FlutterFaiUpgrade.setAlias(alias: '17700000000');
                setState(() {
                  _result = result['result'].toString();
                });
              },
              child: Text('设置别名'),
            ),
            Expanded(
              child: Text(_result),
            ),
          ],
        )),
      ),
    );
  }
}
