
import 'Network.dart';
import '../Global.dart';

class HttpService {
  
  Future<Object> auth() async {
    var response = await Network.sharedInstance.dio.post(
      "/oauth2/authorize",
      data: {
        'client_id' : Global.weiboAppKey,
        'redirect_uri' : '',
        'display' : 'mobile'
      },
    );
    print(response);
    return response;

  }
}

class URLConfig{

  static String baseURL = 'https://api.weibo.com';
  static String auth = '/oauth2/authorize';
  static String weiboRedirectUri = 'https://api.weibo.com/oauth2/default.html';

  static String getToken = '';
}