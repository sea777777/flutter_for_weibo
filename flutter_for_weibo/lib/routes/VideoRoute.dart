import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class VideoRoute extends StatefulWidget {
  const VideoRoute({Key key}) : super(key: key);

  @override
  _VideoRoute createState() => _VideoRoute();
}

class _VideoRoute extends State<VideoRoute>{
 
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
        appBar: CupertinoNavigationBar(
          automaticallyImplyLeading: false,
          automaticallyImplyMiddle: true,
          middle: Container(
            padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Text(
                  '推荐',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFE78734),
                    fontWeight: FontWeight.w500
                    ),
                ),
                Text(
                  '热门',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFF292929),
                    fontWeight: FontWeight.w400
                    ),
                ),
                Text(
                  '小视频',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFF292929),
                    fontWeight: FontWeight.w400
                    ),
                ),
              ],
            ),
          ),
          backgroundColor: Color(0xFFF8F8F8),
        ),
        body: Center(
          child: Text(
            '敬请期待！',
            style: TextStyle(fontSize: 18),
          ),
        )
    );
  }
  
  
}