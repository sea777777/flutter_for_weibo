import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/models/WeiBoCard.dart';
import 'package:flutter_for_weibo/widgets/WBMediaWidget.dart';

class VisitHistoryItem extends StatelessWidget {

  const VisitHistoryItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top:15)),
            Row(
            
              children: <Widget>[
                Image.asset('lib/images/1.png',width: 20,height: 20),
                Text(
                  '我的经常访问',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF5A5A5A),
                  )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Column(
                  children: [
                    Image.asset("lib/images/1.png", width: 80, height: 80),
                    Text(
                      'iOS程序猿',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF535353),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("lib/images/2.png", width: 80, height: 80),
                    Text(
                      '追剧大赏',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF535353),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("lib/images/3.png", width: 80, height: 80),
                    Text(
                      '三分钟...',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF535353),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("lib/images/4.png", width: 80, height: 80),
                    Text(
                      'z说球鞋',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF535353),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            

          ],
        ),
      ),
    );
  }
}
