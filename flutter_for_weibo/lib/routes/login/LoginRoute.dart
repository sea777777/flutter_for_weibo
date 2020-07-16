// 登录页
import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/common/utils/CacheUtil.dart';
import 'package:flutter_for_weibo/common/Global.dart';
import 'package:flutter_for_weibo/common/network/HttpService.dart';
import 'package:flutter_for_weibo/widgets/Browser.dart';
import 'package:flutter_for_weibo/routes/navigation_util.dart';

class LoginRoute extends StatefulWidget {
  LoginRoute({Key key}) : super(key: key);

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
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
        int expires = CacheUtil.sharedInstance.getExpires();

        int diff = expires - curSeconds;
        String token = CacheUtil.sharedInstance.getAccessToken();
        String uid = CacheUtil.sharedInstance.getUid();

        // TODO: 过期时间暂时不处理
        if (token != null && uid != null) {
          NavigatorUtil.goHomePage(context);
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
            NavigatorUtil.goHomePage(context);
          });
        }
      },
    ));
  }
}
