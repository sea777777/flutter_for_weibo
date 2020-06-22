import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/common/network/HttpService.dart';
import '../Global.dart';


class Network{
  Network(){
    
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: URLConfig.baseURL,
        connectTimeout: 15000,
        receiveTimeout: 15000,
        // headers: 
    );

    this.dio = new Dio(baseOptions);
    this.dio.interceptors.add(Global.httpInterceptor);
  
  }

  static Network sharedInstance = new Network();

  BuildContext context;
  BaseOptions baseOptions;
  Dio dio;

}
