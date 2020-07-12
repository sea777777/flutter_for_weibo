import 'package:flutter_for_weibo/common/Global.dart';
import 'package:flutter_for_weibo/common/utils/CacheUtil.dart';
import 'package:flutter_for_weibo/models/WeiBoCard.dart';
import 'Network.dart';

class HttpService {
  
  /*获取微博内容列表
  * containerId : 102803 是热门 ，sinceId/page ：是页数
  * path:默认是：/api/container/getIndex
  */
  static void getWeiBoContent({String path,String containerId,String sinceId,String page,void callback(List<WeiBoCard> result)}){
    var params = {
      'containerid':containerId, 
      'openApp':'0',
      'since_id':(sinceId != null ? sinceId : ''),
      'page':(page != null ? page : '')
    };

    //成功回调函数
    SuccessFunc successFunc = (dynamic result){

      List<WeiBoCard> list = WeiBoCard.fromListJson(result);      
      callback(list);
      
    };
    //失败回调函数
    FailFunc failFunc = (dynamic error){
      //弹窗error
      callback(null);
    };
    Network.sharedInstance.doGet(
      path: (path == null ? URLConfig.getHotWB : path ),
      params: params,
      success: successFunc,
      failure: failFunc,
      baseURL: URLConfig.mBaseURL
    );
  } 


  static void getAccessToken({void callback(Map result)}) {

    String code = CacheUtil.sharedInstance.getAuthorizationCode();
    var params = {'client_id': Global.weiboAppKey,
                  'client_secret' : Global.weiboAppSecret,
                  'grant_type': 'authorization_code',
                  'code' : (code != null ? code : ''),
                  "redirect_uri": URLConfig.weiboRedirectUri,
                  };
  
    //成功回调函数
    SuccessFunc successFunc = (dynamic result){
      String token = result['access_token'];
      String uid = result['uid'];
      int expires = result['expires_in'];//单位： 秒

      DateTime curTime = DateTime.now();
      DateTime newDateTime = curTime.add(new Duration(seconds: expires));
      int lastexpires = newDateTime.millisecondsSinceEpoch;

      //存储token，以后作为请求微博api的基础参数
      CacheUtil.sharedInstance.sotreAccessToken(token);
      CacheUtil.sharedInstance.sotreUid(uid);
      CacheUtil.sharedInstance.sotreExpires(lastexpires);
      callback(result);
    };

    //失败回调函数
    FailFunc failFunc = (dynamic error){
      callback(null);
    };
    Network.sharedInstance.doPost(
      path: URLConfig.getAccessToken,
      params: params,
      success: successFunc,
      failure: failFunc
    );
  }


  


  //获取用户信息
  static void getUserInfo({void callback(Map result)}) {

      String token = CacheUtil.sharedInstance.getAccessToken();
      String uid = CacheUtil.sharedInstance.getUid();

      void requestUserInfo(){
        var params = {'access_token': token == null ? '' : token,
                        'uid' : uid == null ? '' : uid};

        //成功回调函数
        SuccessFunc successFunc = (dynamic result){
          
          callback(result);
          
        };
        //失败回调函数
        FailFunc failFunc = (dynamic error){
          callback(null);
        };
        Network.sharedInstance.doGet(
          path: URLConfig.getUserInfo,
          params: params,
          success: successFunc,
          failure: failFunc
        );
      }
      
      DateTime curTime = DateTime.now();
      int curSeconds = curTime.millisecondsSinceEpoch;
      int expores = CacheUtil.sharedInstance.getExpires();
      
      int diff = expores - curSeconds;
      
      if(diff <= 0 || token == null || uid == null){
        getAccessToken(callback: (Map map){
          requestUserInfo();
        });
      }else{
        requestUserInfo();
      }

    }

}







class URLConfig {
  static const String baseURL = 'https://api.weibo.com';
  static const String mBaseURL = 'https://m.weibo.cn';

  
  static const String auth = '/oauth2/authorize';//微博认证
  static const String weiboRedirectUri = 'https://api.weibo.com/oauth2/default.html';//微博认证后端配置，写死即可

  static const String getToken = '';

  /* 热门微博 : containerid=102803 openApp=0 since_id */
  static const String getHotWB = '/api/container/getIndex';

  /* 同城微博 ：containerid=102803_2222 page=1 */
  /* 榜单微博 ：containerid=102803_ctg1_8999_-_ctg1_8999_home page=1 */
  /* 数码微博 ：containerid=102803_ctg1_5088_-_ctg1_5088 page=1 */
  /* 科技微博 ：containerid=102803_ctg1_2088_-_ctg1_2088 page=1 */
  /* 游戏微博 ：containerid=102803_ctg1_4888_-_ctg1_4888 page=1 */
  static const String getOtherChannelWB = '/api/feed/trendtop';

  //获取用户信息
  static const String getUserInfo = '/2/users/show.json';


  static const String getAccessToken = '/oauth2/access_token';


}
