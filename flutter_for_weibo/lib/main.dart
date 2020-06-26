import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/routes/mainRoute.dart';
import './common/Global.dart';
import './common/network/HttpService.dart';
import './views/Browser.dart';
import './common/network/Network.dart';
import './common/routesTable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //初始化全局必要参数
    Global.init();

    return MaterialApp(
      title: '微博宇宙无敌版',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routesTable.tableMap(),//注册 route 表
      home: MyHomePage(title: '微博宇宙无敌版'),
    );
  }
}




class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void login() {

    Navigator.of(context).pushNamed(routesTable.main_route);
    return;


    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {

      String url = URLConfig.baseURL + URLConfig.auth + "?display=" + Global.weiboDisplay + "&client_id=" + Global.weiboAppKey + "&redirect_uri=" + URLConfig.weiboRedirectUri;

      return new Browser(
        url: url,
        title: "登录",
        filterURLCallback: (String url) {
          int codeIndex = url.lastIndexOf("code");
          if (codeIndex > 0) {
            String code = url.substring(codeIndex + 5);

          }
        },
      );
      
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           RaisedButton(onPressed: login, child: Text("登录")),
          ],
        ),
      ),
    );
  }
}
