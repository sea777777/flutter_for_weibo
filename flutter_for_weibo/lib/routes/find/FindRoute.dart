import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FindRoute extends StatefulWidget {
  const FindRoute({Key key}) : super(key: key);

  @override
  _FindRoute createState() => _FindRoute();
}

class _FindRoute extends State<FindRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          automaticallyImplyLeading: false,
          automaticallyImplyMiddle: true,
          middle: Text('发现'),
          padding: EdgeInsetsDirectional.only(start: 5, end: 0, top: 0, bottom: 0),
          backgroundColor: Color(0xFFF8F8F8),
        ),
        body: Center(
          child: Text(
            '敬请期待！',
            style: TextStyle(fontSize: 18),
          ),
        ));
  }
}
