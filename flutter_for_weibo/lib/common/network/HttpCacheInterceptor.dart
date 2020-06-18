import 'dart:collection';
import 'package:dio/dio.dart';
import '../Global.dart';




class ResponseCache {
  ResponseCache(this.response) {
    timeStamp = DateTime.now().millisecondsSinceEpoch;
  }

  Response response;
  int timeStamp;


  @override
  bool operator ==(other) {
    //如果response的URL一样，那么认为 Response 也一样
    return response.hashCode == other.hashCode;
  }
  
  @override
  int get hashCode => response.realUri.hashCode;

}


//自定义 HTTP 拦截器，缓存数据
class HttpCacheInterceptor extends Interceptor {

  //key:url   value: Response
  //因为我们要保证缓存的数据有序，所以用linkedMap
  var cache = LinkedHashMap<String, ResponseCache>();

  @override
  onRequest(RequestOptions options) async {
    if(!Global.cacheConfig.enable) return options;//如果不开启缓存

    // refresh标记是否是"下拉刷新"
    bool refresh = options.extra["refresh"] == true;
    //如果是下拉刷新，先删除相关缓存
    if (refresh) {
      delete(options.uri.toString());
      return options;
    }

    if (options.extra["noCache"] == false && options.method.toLowerCase() == 'get') {
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      var resp = cache[key];
      if (resp != null) {
        //若缓存未过期，则使用缓存的 response
        if ((DateTime.now().millisecondsSinceEpoch - resp.timeStamp) /(1000*60*60*24) <
            Global.cacheConfig.maxDay) {
          return cache[key].response;
        } else {
          //若已过期则删除缓存，继续向服务器请求
          cache.remove(key);
        }
      }
    }
  }

  @override
  onError(DioError err) async {
   
  }

  @override
  onResponse(Response response) async {
    // 如果启用缓存，将返回结果保存到缓存
    if (Global.cacheConfig.enable) {
      saveCache(response);
    }
  }

  //保存请求的结果
  saveCache(Response object) {
    RequestOptions options = object.request;
    if (options.extra["noCache"] == false && options.method.toLowerCase() == "get") {
      // 如果缓存数量超过最大数量限制，则先移除最早的一条记录
      if (cache.length == Global.cacheConfig.maxCount) {
        cache.remove(cache[cache.keys.first]);
      }
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      cache[key] = ResponseCache(object);
    }
  }

  void delete(String key) {
    cache.remove(key);
  }
}