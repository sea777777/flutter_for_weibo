// import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter_for_weibo/common/network/HttpService.dart';
import '../Global.dart';
import 'dart:convert';

enum HTTPMethod { get, post }

typedef void SuccessFunc(dynamic);
typedef void FailFunc(dynamic);

class Network {

  Dio _dio;
  static Network _network;
  factory Network() => _getInstance();
  static Network get sharedInstance => _getInstance();

  Network._internal() {
    BaseOptions baseOptions = new BaseOptions(
      // baseUrl: URLConfig.baseURL,
      connectTimeout: 15000,
      receiveTimeout: 15000,
      // headers:
    );

    _dio = new Dio(baseOptions);
    // _dio.interceptors.add(Global.httpInterceptor);
  }

  //单例
  static Network _getInstance() {
    if (_network == null) {
      _network = new Network._internal();
    }
    return _network;
  }


  void doGet({String path, Map<String, dynamic> params, SuccessFunc success, FailFunc failure,String baseURL}) {
    _doRequest(path, params, HTTPMethod.get, success,failure,baseURL);
  }

  void doPost({String path, Map<String, dynamic> params,SuccessFunc success, FailFunc failure,String baseURL}) {
    _doRequest(path, params, HTTPMethod.post, success,failure,baseURL);
  }

  /*
    private 方法加下划线
  */
  void _doRequest(String path, Map<String, dynamic> params, HTTPMethod method, [SuccessFunc successCallBack, FailFunc failureCallBack,String baseURL]) async {
    
    if (baseURL == null || baseURL.isEmpty){
      baseURL = URLConfig.baseURL;
    }
    String url = baseURL + path;

    try {
      Response response;
      switch (method) {
        case HTTPMethod.get:
          if (params != null && params.isNotEmpty) {
            response = await _dio.get(url, queryParameters: params);
          } else {
            response = await _dio.get(url);
          }
          break;
        case HTTPMethod.post:
          if (params != null && params.isNotEmpty) {
            response = await _dio.post(url, queryParameters: params);
          } else {
            response = await _dio.post(url);
          }
          break;
      }
      Map<String, dynamic> result = json.decode(response.toString());
      if (successCallBack != null) {
        successCallBack(result);
      }
      
    } catch (exception) {
      if (failureCallBack != null) {
        failureCallBack(exception.toString());
      }
    }
  }
}
