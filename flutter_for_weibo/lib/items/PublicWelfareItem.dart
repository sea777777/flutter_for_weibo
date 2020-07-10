import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/models/WeiBoCard.dart';
import 'package:flutter_for_weibo/widgets/WBMediaWidget.dart';

class PublicWelfareItem extends StatelessWidget {

  const PublicWelfareItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top:10)),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 2, 0),
                  child: Image.asset('lib/images/hand.png',width: 30,height: 30),
                ),
                Text(
                  '微公益',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF5A5A5A),
                  )
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Column(
                  children: [
                    Image.asset("lib/images/zero.png", width: 70, height: 70),
                    Text(
                      '爱心积分',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF535353),
                      ),
                    ),
                    Text(
                      '累计',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w200,
                        color: Color(0xFF535353),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("lib/images/heart.png", width: 70, height: 70),
                    Text(
                      '爱心捐赠',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF535353),
                      ),
                    ),
                    Text(
                      '参与项目捐款',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w200,
                        color: Color(0xFF535353),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("lib/images/star.png", width: 70, height: 70),
                    Text(
                      '星光公益',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF535353),
                      ),
                    ),
                    Text(
                      '助力明星公益',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w200,
                        color: Color(0xFF535353),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 25)),
          ],
        ),
      ),
    );
  }
}
