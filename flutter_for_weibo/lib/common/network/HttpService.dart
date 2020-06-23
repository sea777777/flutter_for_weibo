import 'Network.dart';
import '../Global.dart';


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
    var params = {'containerid':'102803', 'openApp':'0','since_id':'4'};
    Network.sharedInstance.doGet(URLConfig.getWBContent, params,null,null,URLConfig.mWeiBoBaseURL);
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
