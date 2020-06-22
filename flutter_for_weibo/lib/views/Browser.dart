import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//定义拦截URL回调函数
typedef Void FilterURLCallback(String url);

class Browser extends StatelessWidget {
  const Browser({Key key, this.url, this.title, this.filterURLCallback})
      : super(key: key);

  final String url;
  final String title;
  final FilterURLCallback filterURLCallback;

  //拦截的url
  // fun void filterUrl(String url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        //页面刚开始加载
        onPageStarted: (String url) {
          // do something
        },
        //页面已经加载完
        onPageFinished: (String url) {
          //把url传给调用者
          if (this.filterURLCallback != null) {
            this.filterURLCallback(url);
          }
        },
      ),
    );
  }
}
