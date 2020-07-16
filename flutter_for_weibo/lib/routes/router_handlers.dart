import 'package:fluro/fluro.dart';

import 'bottomTabbar/BottomTabbarRoute.dart';
import 'Login/LoginRoute.dart';


// 登录页
Handler loginHandler = Handler(handlerFunc: (context, parameters) {
  return LoginRoute();
},);

// 登录页
Handler homeHandler = Handler(handlerFunc: (context, parameters) {
  return BottomTabbarRoute();
},);