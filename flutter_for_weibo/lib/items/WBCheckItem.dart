import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/models/WeiBoCard.dart';
import 'package:flutter_for_weibo/widgets/WBMediaWidget.dart';

class WBCheckItem extends StatelessWidget {

  const WBCheckItem({Key key}) : super(key: key);

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
                  child: Image.asset('lib/images/check.png',width: 30,height: 30),
                ),
                Text(
                  '微博公益检测',
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
                    Image.asset("lib/images/check1.png", width: 70, height: 70),
                    Text(
                      '微博关注检测',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF535353),
                      ),
                    ),
                    
                  ],
                ),
                Column(
                  children: [
                    Image.asset("lib/images/check2.png", width: 70, height: 70),
                    Text(
                      '查看寂静用户',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF535353),
                      ),
                    ),
                    
                  ],
                ),
                Column(
                  children: [
                    Image.asset("lib/images/check3.png", width: 70, height: 70),
                    Text(
                      '全站最热博主',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
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
