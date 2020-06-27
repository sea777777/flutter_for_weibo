import 'package:flutter/material.dart';
import '../routes/MainRoute.dart';
import '../routes/BottomTabbarRoute.dart';



class RoutesTable{

  static String get mainRoute => 'main_route';
  static String get bottomTabbarRoute => 'bottom_tabbar_route';


  static Map<String, Widget Function(BuildContext)> tableMap(){
    
    return {
        mainRoute : (context) => MainRoute(),
        bottomTabbarRoute : (context) => BottomTabbarRoute(),
      };
  }

}