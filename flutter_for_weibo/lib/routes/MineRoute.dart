import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/items/CategoryItem.dart';
import 'package:flutter_for_weibo/items/MineFooterItem.dart';
import 'package:flutter_for_weibo/items/MineHeaderItem.dart';
import 'package:flutter_for_weibo/items/PublicWelfareItem.dart';
import 'package:flutter_for_weibo/items/SuperTopicItem.dart';
import 'package:flutter_for_weibo/items/VisitHistoryItem.dart';
import 'package:flutter_for_weibo/items/WBCheckItem.dart';

class MineRoute extends StatefulWidget {
  const MineRoute({Key key}) : super(key: key);

  @override
  _MineRoute createState() => _MineRoute();
}

class _MineRoute extends State<MineRoute> {
  ScrollController scrollController = ScrollController();
  bool isLoading ;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget renderBottom() {
    if (this.isLoading) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '努力加载中...',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF333333),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: Text(
          '上拉加载更多',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF333333),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: this.scrollController,
      itemCount: 7,
      separatorBuilder: (context, index) {
        return Divider(
                  height: .5,
                  color: Color(0xFFEEEEEE),
                  thickness: 10,
                  indent: 0,
                  endIndent: 0
               );
      },
      itemBuilder: (context, index) {
        if (index == 0 ) {
          return MineHeaderItem(user: null);
        } else if(index == 1){
          return CategoryItem();
        } else if(index == 2){
          return VisitHistoryItem();
        } else if(index == 3){
          return SuperTopicItem();
        } else if(index == 4){
          return PublicWelfareItem();
        } else if(index == 5){
          return WBCheckItem();
        } else if(index == 6){
          return MineFooterItem();
        }
      },
    );
  }
}
