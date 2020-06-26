import 'dart:ffi';

import 'Network.dart';
import 'package:flutter_for_weibo/models/WeiBoModel.dart';

class HttpService {
  
  // Future<Object> auth() async {
  //   var response = await Network.sharedInstance.dio.post(
  //     "/oauth2/authorize",
  //     data: {
  //       'client_id': Global.weiboAppKey,
  //       'redirect_uri': '',
  //       'display': 'mobile'
  //     },
  //   );
  //   print(response);
  //   return response;
  // }


  static void getWeiBoContent(){
    var params = {'containerid':'102803', 'openApp':'0','since_id':'1'};
    
    //成功回调函数
    SuccessFunc successFunc = (dynamic result){
      WeiBoModel model = WeiBoModel.fromJson(result);
    };
    //失败回调函数
    FailFunc failFunc = (dynamic error){
      
    };
    Network.sharedInstance.doGet(URLConfig.getWBContent, params,successFunc,failFunc,URLConfig.mWeiBoBaseURL);
  }

}

class URLConfig {
  static const String baseURL = 'https://api.weibo.com';
  static const String mWeiBoBaseURL = 'https://m.weibo.cn';

  static const String auth = '/oauth2/authorize';
  static const String weiboRedirectUri = 'https://api.weibo.com/oauth2/default.html';

  static const String getToken = '';
  static const String getWBContent = '/api/container/getIndex';
}
