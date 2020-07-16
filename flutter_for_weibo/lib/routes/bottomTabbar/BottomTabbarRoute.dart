import 'package:flutter/material.dart';
import '../video/VideoRoute.dart';
import '../find/FindRoute.dart';
import '../message/MessageRoute.dart';
import '../mine/MineRoute.dart';
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
    MineRoute()   //我的页面
  ];
  
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: Image.asset("lib/images/tabbar_home.png", width: 35, height: 35),
      activeIcon: Image.asset("lib/images/tabbar_home_highlighted.webp", width: 35, height: 35),
      title: Text(
        "微博",
        style: TextStyle(
          color: Color(0xFF3D3D3D),
          fontSize: 11,
        ),
      ),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: Image.asset("lib/images/composer_video_icon_album.png", width: 35, height: 35),
      activeIcon: Image.asset("lib/images/tabbar_video_highlighted.png",width: 35, height: 35),
      title: Text(
        "视频",
        style: TextStyle(
          color: Color(0xFF3D3D3D),
          fontSize: 11.0,
        ),
      ),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: Image.asset("lib/images/tabbar_discover.png", width: 35, height: 35),
      activeIcon: Image.asset("lib/images/tabbar_discover_highlighted.png",width: 35, height: 35),
      title: Text(
        "发现",
        style: TextStyle(
          color: Color(0xFF3D3D3D),
          fontSize: 11.0,
        ),
      ),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: Image.asset("lib/images/tabbar_message_center.webp", width: 35, height: 35),
      activeIcon: Image.asset("lib/images/tabbar_message_center_highlighted.webp",width: 35, height: 35),
      title: Text(
        "消息",
        style: TextStyle(
          color: Color(0xFF3D3D3D),
          fontSize: 11.0,
        ),
      ),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: Image.asset("lib/images/tabbar_profile.webp", width: 35, height: 35),
      activeIcon: Image.asset("lib/images/tabbar_profile_highlighted.webp", width: 35, height: 35),
      title: Text(
        "我的",
        style: TextStyle(
          color: Color(0xFF3D3D3D),
          fontSize: 11.0,
        ),
      ),
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
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _onChangeRoute(index);
        },
        selectedFontSize: 11.0,
        unselectedFontSize: 11.0,
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

