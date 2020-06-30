import 'package:flutter/material.dart';
import './VideoRoute.dart';
import './FindRoute.dart';
import './MessageRoute.dart';
import './MineRoute.dart';
import 'MainRoute.dart';

class BottomTabbarRoute extends StatefulWidget {
  const BottomTabbarRoute({Key key}) : super(key: key);

  @override
  _BottomTabbarRoute createState() => _BottomTabbarRoute();
}

class _BottomTabbarRoute extends State<BottomTabbarRoute> {
  
  int currentIndex = 0;

  
  final pages = [
    MainRoute(),    //微博首页
    VideoRoute(),   //视频页面
    FindRoute(),    //发现页
    MessageRoute(), //消息页
    MineRoute()     //我的页面
  ];
  
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Image.asset("lib/images/tabbar_home.png", width: 35, height: 35),
      activeIcon: Image.asset("lib/images/tabbar_home_highlighted.webp", width: 35, height: 35),
      title: Text("微博"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.green,
      icon: Image.asset("lib/images/composer_video_icon_album.png", width: 35, height: 35),
      title: Text("视频"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.amber,
      icon: Image.asset("lib/images/tabbar_discover.png", width: 35, height: 35),
      title: Text("发现"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.red,
      icon: Image.asset("lib/images/tabbar_message_center.webp", width: 35, height: 35),
      title: Text("消息"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: Image.asset("lib/images/tabbar_profile.webp", width: 35, height: 35),
      activeIcon: Image.asset("lib/images/tabbar_profile.webp", width: 35, height: 35),
      title: Text("我的"),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          _onChangeRoute(index);
        },
      ),
      body: pages[currentIndex],
    );
  }

  //点击底部tab 回调
  void _onChangeRoute(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }


}

