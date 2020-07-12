import './network/HttpCacheConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './network/HttpCacheInterceptor.dart';

class Global {
  static SharedPreferences prefs;

  //缓存配置
  static HttpCacheConfig cacheConfig;

  //拦截器，负责缓存response
  static HttpCacheInterceptor httpInterceptor;

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  //初始化全局信息，会在APP启动时执行
  static Future init() async {

    prefs = await SharedPreferences.getInstance();
    cacheConfig = HttpCacheConfig();
    httpInterceptor = HttpCacheInterceptor();

  }
  
  //微博授权登录相关
  static String weiboAppKey = '1207543647';
  static String weiboAppSecret = '9e80543f2e9546c76e06d3fd9d1ef9eb';
  static String weiboDisplay = 'mobile';


}
