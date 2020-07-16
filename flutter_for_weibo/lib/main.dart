import 'package:flutter/material.dart';

import 'package:flutter_for_weibo/routes/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_for_weibo/routes/routes.dart';

void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Application.router.generator,
    );
  }
}
