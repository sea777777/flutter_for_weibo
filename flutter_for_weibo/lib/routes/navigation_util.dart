import 'package:flutter/material.dart';

import 'application.dart';
import 'routes.dart';
class NavigatorUtil {

  // 首页
  static void goHomePage(BuildContext context) {
    Application.router.navigateTo(context, Routes.home);
  }
  
  // 登录页
  static void goLoginPage(BuildContext context) {
    Application.router.navigateTo(context, Routes.login);
  }
}