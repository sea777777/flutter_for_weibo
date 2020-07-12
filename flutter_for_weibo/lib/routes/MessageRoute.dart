import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/items/MessageItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_for_weibo/models/WeiBoCard.dart';
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

  List<User> userList() {
    User at = new User(screenName: '@我的', profileImgUrl: 'lib/images/at.png');
    User comment = new User(screenName: '评论',profileImgUrl: 'lib/images/comment.png');
    User zan = new User(screenName: '赞', profileImgUrl: 'lib/images/zan1.png');
    User rss = new User(screenName: '订阅消息', desc: '[39条] 微博钱包：[链接]恭喜您获得微博会员。',profileImgUrl: 'lib/images/rss.png');
    User user = new User(screenName: '乡村教师代言人-马云', desc: '我这有个P10岗，来不来？',profileImgUrl: 'lib/images/mayun.png');
    User user1 = new User(screenName: '普京', desc: '最近又搞了两艘航母，兄弟啥时候来看看？',profileImgUrl: 'lib/images/pujing.png');
    User user2 = new User(screenName: '特朗普', desc: '老铁，最近我贼闹心。',profileImgUrl: 'lib/images/telangpu.png');
    User user3 = new User(screenName: '雷军', desc: '兄弟最近咋样？are you ok ?',profileImgUrl: 'lib/images/leijun.png');
    User user4 = new User(screenName: '王力宏', desc: '晚上一起来KTV唱歌？',profileImgUrl: 'lib/images/wanglihong.png');
    User user5 = new User(screenName: '蔡徐坤', desc: '下班去打篮球？',profileImgUrl: 'lib/images/caixukun.png');
    User user6 = new User(screenName: '刘德华', desc: '老铁，你说我跟王力宏我俩谁帅？',profileImgUrl: 'lib/images/liudehua.png');
    User user7 = new User(screenName: '比尔盖茨', desc: '哥，我最近手头紧，想问你借点钱。',profileImgUrl: 'lib/images/biergaici.png');
    return [at,comment,zan,rss,user,user1,user2,user3,user4,user5,user6,user7];
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
        itemCount: userList().length,
        separatorBuilder: (context, index) {
          return Divider(height: .5, color: Color(0xFFEEEEEE), indent: 0, endIndent: 0);
        },
        itemBuilder: (context, index) {
          User user = userList()[index];
          return MessageItem(user: user);
        },
      ),
    );
  }
}
