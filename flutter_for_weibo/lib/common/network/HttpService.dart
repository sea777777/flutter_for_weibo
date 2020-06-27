import 'package:flutter_for_weibo/models/WeiBoCard.dart';
import 'Network.dart';

class HttpService {
  
  /*获取微博内容列表
  * containerId : 102803 是喜欢 ，sinceId ：是页数
  */
  static void getWeiBoContent({String containerId,String sinceId,void callback(List<WeiBoCard> result)}){
    var params = {'containerid':containerId, 'openApp':'0','since_id':sinceId};
    print('since_id' + sinceId);
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
    Network.sharedInstance.doGet(URLConfig.getHotWB, params,successFunc,failFunc,URLConfig.mBaseURL);
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

  /* 同城微博 ：containerid=102803_2222 page */
  static const String getSameCityWB = 'api/feed/trendtop';

  /* 榜单微博 ：containerid=102803_ctg1_8999_-_ctg1_8999_home page */
  static const String getTrendTopWB = '/api/feed/trendtop';

  /* 数码微博 ：containerid=102803_ctg1_5088_-_ctg1_5088 page */
  static const String getDigitalWB = '/api/feed/trendtop';

  /* 科技微博 ：containerid=102803_ctg1_2088_-_ctg1_2088 page=*/
  static const String getITWB = '/api/feed/trendtop';

  // containerid=102803_ctg1_4888_-_ctg1_4888 page=3
  // 游戏

}
