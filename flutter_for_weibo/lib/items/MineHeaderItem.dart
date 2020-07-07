import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/models/WeiBoCard.dart';
import 'package:flutter_for_weibo/widgets/WBMediaWidget.dart';

class MineHeaderItem extends StatelessWidget {
  final User user;

  const MineHeaderItem({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(
                height: .5,
                color: Color(0x1C000000),
                thickness: 10,
                indent: 0,
                endIndent: 0
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: NetworkImage(
                            'http://pic1.58cdn.com.cn/zhuanzh/n_0959110f0f774a32b9823e1c12e2d511.jpg?w=750&h=0')),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                      child: Text(
                        'Sea77777',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 0),
                      child: Text(
                        '简介：暂无介绍',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF969696),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(height: .5, color: Color(0x1C000000), indent: 0, endIndent: 0),
            Padding(padding: EdgeInsets.only(top:15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      '262',
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '微博',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF969696),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '379',
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '关注',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF969696),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '66',
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '粉丝',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF969696),
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
