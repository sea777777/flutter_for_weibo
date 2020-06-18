import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Global.dart';


class Network{
  Network(){
    
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: 'https://open.weibo.cn',//https://api.weibo.com
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
