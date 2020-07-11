import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
//自定义导航器
class CustomNavBar extends StatelessWidget {
  final String title;
  final Widget body;
  final Color appBarBackgroundColor;
  final double elevation; //底部阴影 ，默认0
  final List<Widget> actions; //Widgets to display in a row after the [title] widget.
  final Widget leading; //Widget to place at the start of the navigation bar. Normally a back button for a normal page or a cancel button for full page dialogs.
  final Widget trailing; //Widget to place at the end of the navigation bar. Normally additional actions taken on the page such as a search or edit function.
  Color backgroundColor;
  Widget middle;//中间自定义控件

  CustomNavBar(
      {this.title = '',
      this.appBarBackgroundColor,
      this.elevation = 0,
      this.actions,
      this.leading,
      this.backgroundColor,
      this.trailing,
      this.body,
      this.middle}
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(context),
      backgroundColor: Colors.white,
      body: body,
    );
  }

  Widget _customAppBar(BuildContext context) {

    //如果是ios 平台
    if (Platform.isIOS) { 
      return CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        automaticallyImplyMiddle: true,
        middle: middle == null ? Text(title) : middle,
        padding: EdgeInsetsDirectional.only(start: 0, end: 10, top: 0, bottom: 0),
        backgroundColor: this.backgroundColor,
        trailing: this.trailing,
        leading: this.leading,
        actionsForegroundColor: Colors.grey,
      );
    } else {
      //如果是安卓平台
      return PreferredSize(
        preferredSize: Size.fromHeight(44),
        child: AppBar(
          title: Text(title),
          backgroundColor: appBarBackgroundColor,
          elevation: elevation,
          actions: actions,
          leading: leading,
        ),
      );
    }
  }
}
