import 'package:flutter/material.dart';
import '../routes/mainRoute.dart';

class routesTable{

  static String get main_route => 'main_route';

  static Map<String, Widget Function(BuildContext)> tableMap(){
    
    return {
        main_route : (context) => mainRoute(),
      };
  }

}