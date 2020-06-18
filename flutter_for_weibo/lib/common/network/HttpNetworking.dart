
import 'Network.dart';
import '../Global.dart';

class HttpNetworking {
  
  Future<Object> auth() async {
    var response = await Network.sharedInstance.dio.post(
      "/oauth2/authorize",
      data: {
        'client_id' : Global.weiboAppKey,
        'redirect_uri' : 'flutter://do.nothing',
        'display' : 'mobile'
      },
    );
    print(response);
    return response;

  }
}