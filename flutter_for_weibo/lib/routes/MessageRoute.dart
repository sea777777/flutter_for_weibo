import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/items/MessageItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_for_weibo/widgets/CustomNavBar.dart';

class MessageRoute extends StatefulWidget {
  const MessageRoute({Key key}) : super(key: key);

  @override
  _MessageRoute createState() => _MessageRoute();
}

class _MessageRoute extends State<MessageRoute> {
  ScrollController scrollController = ScrollController();
  bool isLoading;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget renderBottom() {
    if (this.isLoading) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '努力加载中...',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF333333),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: Text(
          '上拉加载更多',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF333333),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
      title: '消息',
      backgroundColor: Color(0xFFF8F8F8),
      leading: Container(
        padding: EdgeInsets.fromLTRB(8, 12, 0, 0),
        child: Text(
          '发现群',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF222222),
          ),
        ),
      ),
      trailing: new IconButton(
        icon: Image.asset(
          'lib/images/msg_add.png',
          width: 90,
          height: 90,
        ),
        onPressed: () {},
      ),
      middle: Container(
        padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Text(
              '动态',
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w200),
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 9),
                  child: Text(
                    '消息',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 1),
                  width: 50,
                  height: 7,
                  child: Image.asset(
                    'lib/images/line.png',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView.separated(
        controller: this.scrollController,
        itemCount: 7,
        separatorBuilder: (context, index) {
          return Divider(
              height: .5,
              color: Color(0xFFEEEEEE),
              indent: 0,
              endIndent: 0);
        },
        itemBuilder: (context, index) {
          return MessageItem();
        },
      ),
    );
  }
}
