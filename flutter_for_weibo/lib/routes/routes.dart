import 'package:fluro/fluro.dart';
import 'router_handlers.dart';

class Routes {
  // 跟路由 登录页
  static String root = '/';
  // 首页
  static String home = '/home';
  // 登录页
  static String login = '/login';


// 注册路由
  static void configureRoutes(Router router) {
    // 未找到路由
    router.notFoundHandler = Handler(handlerFunc: (context, parameters) {
      print('route not found');
    });
    // 根目录是登录页
    router.define(root, handler: loginHandler);
    // 首页
    router.define(home, handler: homeHandler);
    // 登录页
    router.define(login, handler: loginHandler);

  }
}
