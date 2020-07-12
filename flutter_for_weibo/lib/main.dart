import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/common/utils/CacheUtil.dart';
import 'package:flutter_for_weibo/routes/BottomTabbarRoute.dart';
import './common/Global.dart';
import './common/network/HttpService.dart';
import './widgets/Browser.dart';
import './common/RoutesTable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: RoutesTable.tableMap(), //这里，我们统一对所有route进行注册，所以需要跳转的页面，请在 RoutesTable 进行注册
      home: MyHomePage(),
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
  //初始化全局必要参数
  Future prepareGlobal() async {
    await Global.init();
    await CacheUtil.init();
  }

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {


     //如果上次登陆过，那么下次自动登录
     CacheUtil.init().then((value) {
       Global.init().then((value) {

          DateTime curTime = DateTime.now();
          int curSeconds = curTime.millisecondsSinceEpoch;
          int expores = CacheUtil.sharedInstance.getExpires();
          
          int diff = expores - curSeconds;
          String token = CacheUtil.sharedInstance.getAccessToken();
          String uid = CacheUtil.sharedInstance.getUid();
        
          if(diff > 0 && token != null && uid != null){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return BottomTabbarRoute();
              }));
          }
          
       });
    });


    String url = URLConfig.baseURL +
        URLConfig.auth +
        "?display=" +
        Global.weiboDisplay +
        "&client_id=" +
        Global.weiboAppKey +
        "&redirect_uri=" +
        URLConfig.weiboRedirectUri;


    return Scaffold(
      body: Browser(
        url: url,
        title: "登录",
        filterURLCallback: (String filterUrl) {
          int codeIndex = filterUrl.lastIndexOf("code");
          if (codeIndex > 0) {
            String code = filterUrl.substring(codeIndex + 5);

            //准备必要参数
            prepareGlobal().then((value) {
              CacheUtil.sharedInstance.sotreAuthorizationCode(code);
              Navigator.of(context).pushNamed(RoutesTable.bottomTabbarRoute);
            });

          }          
      },
    )
    );

  }
}
