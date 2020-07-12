import 'package:flutter/material.dart';

class MineHeaderItem extends StatelessWidget {
  final Map userInfo;
  const MineHeaderItem({Key key, this.userInfo}) : super(key: key);

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
                color: Color(0xFFEEEEEE),
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
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                        image: NetworkImage(
                            (userInfo == null ? '' : userInfo['profile_image_url'].toString())
                        )
                      ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                      child: Text(
                        userInfo == null ? '暂无昵称' : userInfo['screen_name'].toString(),
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
                        userInfo == null ? '简介：暂无' : userInfo['description'].toString(),
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
                      userInfo != null ? userInfo['statuses_count'].toString() : '0',
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
                      userInfo != null ? userInfo['friends_count'].toString() : '0',
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
                      userInfo != null ? userInfo['followers_count'].toString() : '0',
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
