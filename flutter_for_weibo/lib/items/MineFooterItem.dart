import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/models/WeiBoCard.dart';
import 'package:flutter_for_weibo/widgets/WBMediaWidget.dart';

class MineFooterItem extends StatelessWidget {
  const MineFooterItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 15, 2, 0),
                  width: 32,
                  height: 32,
                  child: Image.asset('lib/images/card1.png'),
                ),
                RichText(
                  text: TextSpan(
                      text: "免流量",
                      style: TextStyle(color: Color(0xFF000000), fontSize: 13),
                      children: [
                        TextSpan(
                          text: "  流量免费任性玩",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 12,
                            fontWeight: FontWeight.w200
                          ),
                        ),
                      ]),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 15, 2, 0),
                  width: 32,
                  height: 32,
                  child: Image.asset('lib/images/card2.png'),
                ),
                RichText(
                  text: TextSpan(
                      text: "微博运动",
                      style: TextStyle(color: Color(0xFF000000), fontSize: 13),
                      children: [
                        TextSpan(
                          text: "  流量免费任性玩",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 12,
                            fontWeight: FontWeight.w200
                          ),
                        ),
                      ]),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 15, 2, 0),
                  width: 32,
                  height: 32,
                  child: Image.asset('lib/images/card3.png'),
                ),
                RichText(
                  text: TextSpan(
                      text: "草稿箱",
                      style: TextStyle(color: Color(0xFF000000), fontSize: 13),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
