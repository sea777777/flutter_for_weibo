import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/models/WeiBoCard.dart';
import 'package:flutter_for_weibo/widgets/WBMediaWidget.dart';

class CategoryItem extends StatelessWidget {

  const CategoryItem({Key key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Column(
                  children: [
                    Image.asset("lib/images/pic.png", width: 50, height: 50),
                    Text(
                      '我的相册',
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
                    Image.asset("lib/images/story.png", width: 50, height: 50),
                    Text(
                      '我的故事',
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
                    Image.asset("lib/images/zan.png", width: 50, height: 50),
                    Text(
                      '我的赞',
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
                    Image.asset("lib/images/fansstory.png", width: 50, height: 50),
                    Text(
                      '粉丝服务',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Column(
                  children: [
                    Image.asset("lib/images/qianbao.png", width: 50, height: 50),
                    Text(
                      '微博钱包',
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
                    Image.asset("lib/images/bag.png", width: 50, height: 50),
                    Text(
                      '微博优选',
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
                    Image.asset("lib/images/ad.png", width: 50, height: 50),
                    Text(
                      '广告中心',
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
                    Image.asset("lib/images/center.png", width: 50, height: 50),
                    Text(
                      '客服中心',
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
            Padding(padding: EdgeInsets.only(top: 30)),

          ],
        ),
      ),
    );
  }
}
