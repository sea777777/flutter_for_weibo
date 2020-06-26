import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/models/WeiBoModel.dart';
import 'package:flutter_for_weibo/items/weiboItem.dart';


class mainRoute extends StatefulWidget {
  const mainRoute({Key key}) : super(key: key);

  @override
  _mainRouteState createState() => _mainRouteState();
}

class _mainRouteState extends State<mainRoute> {
  bool isLoading = false;
  ScrollController scrollController = ScrollController();
  List<WeiBoCard> list ;

  @override
  void initState() {
    super.initState();
    this.scrollController.addListener(() {
      if (
        !this.isLoading &&
        this.scrollController.position.pixels >= this.scrollController.position.maxScrollExtent
      ) {
        setState(() {
          this.isLoading = true;
          this.loadMoreData();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    this.scrollController.dispose();
  }

  Future loadMoreData() {
    return Future.delayed(Duration(seconds: 1), () {
      setState(() {
        this.isLoading = false;
        // this.list.addAll(newsList);
      });
    });
  }

  Widget renderBottom() {
    if(this.isLoading) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '努力加载中...',
              style: TextStyle(
                fontSize: 15,
                color: Color(0x000000),
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
            color: Color(0xffffff),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: this.scrollController,
      itemCount: 10 + 1,
      separatorBuilder: (context, index) {
        return Divider(height: .5, color: Color(0xffffff));
      },
      itemBuilder: (context, index) {
        if (index < 10 ){
          return weiboItem(data: null);
        } else {
          return this.renderBottom();
        }
      },
    );
  }
}
