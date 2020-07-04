import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/common/network/HttpService.dart';
import 'package:flutter_for_weibo/items/WeiboItem.dart';
import 'package:flutter_for_weibo/models/WeiBoCard.dart';
import 'VideoRoute.dart';
import 'FindRoute.dart';
import 'MessageRoute.dart';
import 'MineRoute.dart';


class MainRoute extends StatefulWidget {
  const MainRoute({Key key}) : super(key: key);

  @override
  _MainRoute createState() => _MainRoute();
}

class _MainRoute extends State<MainRoute> with SingleTickerProviderStateMixin{
  bool isLoading = false;
  ScrollController scrollController = ScrollController();
  List<WeiBoCard> list = List<WeiBoCard>();
  int sinceId = 0;
  DateTime lastTime ;

  TabController tabController;
  var tabs = <Tab>[];

  @override
  void initState() {
    super.initState();
  
    tabs = <Tab>[
      Tab(text: "热门"),
      Tab(text: "同城",),
      Tab(text: "榜单",),
      Tab(text: "数码",),
      Tab(text: "科技"),
      Tab(text: "游戏"),
    ];
    tabController = TabController(initialIndex: 0, length: tabs.length, vsync: this);


    lastTime = DateTime.now();

    loadData();

    this.scrollController.addListener(() {
      if (!this.isLoading && this.scrollController.position.pixels >= this.scrollController.position.maxScrollExtent) {
          DateTime curTime = DateTime.now();
          Duration during = curTime.difference(lastTime);

          if(during.inSeconds > 2 || lastTime == null){
            this.isLoading = true;
            this.loadData();
            lastTime = curTime;
          }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    this.scrollController.dispose();
  }

  loadData() {

    HttpService.getWeiBoContent(
      containerId: '102803',
      sinceId: sinceId.toString(),
      callback: (List<WeiBoCard> cardList){
        if(cardList != null && cardList.length > 0){
          for (var weibocard in cardList) {
            if(!list.contains(weibocard)){
              list.add(weibocard);
            }
          }
        }
        
        this.setState(() {
          this.sinceId ++;
          this.isLoading = false;
        });
      }
    );
    
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

    return DefaultTabController(
      length: tabs.length,
      child: MaterialApp(
        theme: ThemeData(primaryColor: Color(0xFFFFFFFF)),
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: TabBar(
              controller: tabController,//可以和TabBarView使用同一个TabController
              tabs: tabs,
              isScrollable: true,
              indicatorColor: Color(0xFFFFFFFF),
              indicatorWeight: 1,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.only(bottom: 10.0),
              labelPadding: EdgeInsets.only(left: 20),
              labelColor: Color(0xffE18519),
              labelStyle: TextStyle(
                fontSize: 16.0,
              ),
              unselectedLabelColor: Color(0xff3D3D3D),
              unselectedLabelStyle: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          body: TabBarView(
              controller: tabController,
              children: tabs.map((Tab tab) =>
                  Container(child: Center(child: 
                    ListView.separated(
                      controller: this.scrollController,
                      itemCount: this.list.length + 1,
                      separatorBuilder: (context, index) {
                        return Divider(height: .5,color: Color(0xFFDDDDDD));
                      },
                      itemBuilder: (context, index) {
                        if (index < this.list.length) {
                          return WeiboItem(data: this.list[index]);
                        } else {
                          return this.renderBottom();
                        }
                      },
                    ),
                  ),
                  )).toList()),
        ),
      ),
    );

  }
}
