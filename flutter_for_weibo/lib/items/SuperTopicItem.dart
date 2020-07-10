import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/models/WeiBoCard.dart';
import 'package:flutter_for_weibo/widgets/WBMediaWidget.dart';

class SuperTopicItem extends StatelessWidget {

  const SuperTopicItem({Key key}) : super(key: key);

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
                  child: Image.asset('lib/images/supertopic.png',width: 30,height: 30),
                ),
                Text(
                  '超话社区',
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
                    Image.asset("lib/images/spring.png", width: 80, height: 80),
                    Text(
                      '春晚答题王',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF535353),
                      ),
                    ),
                    Text(
                      '已关注',
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
                    Image.asset("lib/images/give.png", width: 80, height: 80),
                    Text(
                      '赠书福利',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF535353),
                      ),
                    ),
                    Text(
                      '已关注',
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
                    Image.asset("lib/images/supercar.png", width: 80, height: 80),
                    Text(
                      '豪车',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF535353),
                      ),
                    ),
                    Text(
                      '已关注',
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
                    Image.asset("lib/images/school.png", width: 80, height: 80),
                    Text(
                      '校园',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF535353),
                      ),
                    ),
                    Text(
                      '已关注',
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
