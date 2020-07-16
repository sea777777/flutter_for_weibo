import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/common/network/HttpService.dart';
import 'package:flutter_for_weibo/items/WeiboItem.dart';
import 'package:flutter_for_weibo/models/WeiBoCard.dart';


class MainRoute extends StatefulWidget {
  const MainRoute({Key key}) : super(key: key);

  @override
  _MainRoute createState() => _MainRoute();
}

class _MainRoute extends State<MainRoute> with SingleTickerProviderStateMixin{
  bool isLoading = false;
  ScrollController scrollController = ScrollController();
  List<List<WeiBoCard>> list = List<List<WeiBoCard>>();
  List<Map<String,String>> urlList = List<Map<String,String>>();
  int sinceId = 0;
  DateTime lastTime ;
  int currentIndex = 0;

  TabController tabController;
  List<Tab> tabs = List<Tab>();

  @override
  void initState() {
    super.initState();
  
    initTabsData();

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

  initTabsData(){
    List<Map<String,String>> dataSource = [
      {"text":"热门","path":"/api/container/getIndex",'containerid':'102803'},
      {"text":"同城","path":URLConfig.getOtherChannelWB,'containerid':'102803_2222'},
      {"text":"榜单","path":URLConfig.getOtherChannelWB,'containerid':'102803_ctg1_8999_-_ctg1_8999_home'},
      {"text":"数码","path":URLConfig.getOtherChannelWB,'containerid':'102803_ctg1_5088_-_ctg1_5088'},
      {"text":"科技","path":URLConfig.getOtherChannelWB,'containerid':'102803_ctg1_2088_-_ctg1_2088'},
      {"text":"游戏","path":URLConfig.getOtherChannelWB,'containerid':'102803_ctg1_4888_-_ctg1_4888'}
    ];
    
    for (Map item in dataSource) {
      tabs.add(Tab(text: item['text']));
      list.add(List<WeiBoCard>());
      urlList.add({'path':item['path'],'containerid':item['containerid'],'currentPage':'1'});
    }
  }


  loadData() {
    List dataList = list[currentIndex];
    Map currentURLMap = urlList[currentIndex];
    String containerid = currentURLMap['containerid'];
    String path = (currentIndex == 0 ? null : currentURLMap['path']);
    String page = (currentIndex == 0 ? null : currentURLMap['currentPage']);
    String sinceId = (currentIndex != 0 ? null : currentURLMap['currentPage']);

    HttpService.getWeiBoContent(
      page: page,
      sinceId: sinceId,
      path: path,
      containerId: containerid,
      callback: (List<WeiBoCard> cardList){
        if(cardList != null && cardList.length > 0){
          for (var weibocard in cardList) {
            if(!dataList.contains(weibocard)){
              dataList.add(weibocard);
            }
          }
        }
        
        this.setState(() {
          String currentPage = currentURLMap['currentPage'];
          int page = int.parse(currentPage) + 1;
          currentURLMap['currentPage'] = page.toString();
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
              onTap: (int index){
                currentIndex = index;
                loadData();
              },
            ),
          ),
          body: TabBarView(
              controller: tabController,
              children: tabs.map((Tab tab) =>
                  Container(child: Center(child: 
                    ListView.separated(
                      controller: this.scrollController,
                      itemCount: (this.list.length > currentIndex ? this.list[currentIndex].length : 0),
                      separatorBuilder: (context, index) {
                        return Divider(height: .5,color: Color(0xFFDDDDDD));
                      },
                      itemBuilder: (context, index) {
                        List dataList = this.list[currentIndex];
                        if (index < dataList.length) {
                          return WeiboItem(data: dataList[index]);
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
