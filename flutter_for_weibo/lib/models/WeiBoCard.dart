

class WeiBoCard{
  String itemid ;
  String scheme;//微博详情链接: https://m.weibo.cn/status/4521192037474510?mblogid=4521192037474510&luicode=10000011&lfid=102803
  String createAt;//创建时间
  String text;//微博的文字部分（包含HTML标签）
  String source;//发布微博的源：来自:微博 weibo.com
  User user; //用户信息
  PageInfo pageInfo;//图片/视频信息
  int repostCount;//转发数
  int commentCount;//评论数
  int attCount;//赞👍数量
  String rawText;//源文本
  int vipType;//vip类型 0：红v 皇冠
  List<Map<String,String>> pics = new List<Map<String,String>>();//Map类型：key（pid url size geo）如果没有，就找pageinfo 看type是啥

  WeiBoCard.fromJson(Map<String,dynamic> json){
    itemid = json['itemid'] == null ? json['mid'] : json['itemid'];
    scheme = json['scheme'];
    Map mblog = json['mblog'] == null ? json : json['mblog'];
    createAt = mblog['created_at'];
    text = mblog['text'];
    source = mblog['source'];
    Map userMap = mblog['user'];
    if(userMap != null && userMap.isNotEmpty){
      user = User.fromJson(mblog['user']);
    }
    
    repostCount = mblog['reposts_count'];
    commentCount = mblog['comments_count'];
    attCount = mblog['attitudes_count'];
    rawText = mblog['raw_text'];
    vipType = mblog['mblog_vip_type'];
    Map pageInfoMap = mblog['page_info'];
    if(pageInfoMap != null && pageInfoMap.isNotEmpty){
      pageInfo = PageInfo.fromJson(mblog['page_info']);
    }
    List tempPics = mblog['pics'];
    if (tempPics != null){
      for (Map item in tempPics) {
        Map<String,String> pic = new Map();
        String url = item['url'];
        String pid = item['pid'];
        pic['url'] = url;
        pic['pid'] = pid;
        pics.add(pic);
      }
    }
    
  }

  //解析 list
  static List<WeiBoCard> fromListJson(Map<String,dynamic> json){
    Map<String, dynamic> data = json['data'];
    List dataCards =  data['cards'] == null ? data['statuses'] : data['cards'];
    List<WeiBoCard> cards = new List();
    if(dataCards != null){
      for (var cardjson in dataCards) {
        if(cardjson is Map){
          WeiBoCard card = WeiBoCard.fromJson(cardjson);
          cards.add(card);
        }
      }
    }
    
    return cards;
  }

  @override
  bool operator == (other) {
    return this.hashCode == other.hashCode;
  }
  
  //微博数据拉下来会重复，所以用itemid作为唯一标示
  @override
  int get hashCode {
    int index = this.itemid.lastIndexOf('_');
    String itemCode = this.itemid.substring(index+1);
    return int.tryParse(itemCode) ?? -1;
  }
  
}




class User{
  int id;
  String screenName;//用户名
  String profileImgUrl;//头像
  String profileUrl;//当前用户的profile页
  String verifiedReason;//微博认证：如：原创视频播主,可为空

  User.fromJson(Map<String,dynamic> json){
    id = json['id'];
    screenName = json['screen_name'];
    profileImgUrl = json['profile_image_url'];
    profileUrl = json['profile_url'];
    verifiedReason = json['verified_reason'];

  }
}

class PageInfo{
  String pageUrl;
  String type;//vide 、webpage、search_topic(search的数据)、place（同城）
  MediaInfo mediaInfo;//多媒体信息 视频 图片
  String playCount;//32万次观看
  String pageTitle;//微博视频
  String content1;//微博视频
  String content2;//你们能坚持一件事多久？#非遗在身边# #遇见艺术# #国学新青年#  #王者荣耀@微博故事  @微博国学  

  PageInfo.fromJson(Map<String,dynamic> json){
      pageUrl = json['page_url'];
      type = json['type'];
      Map mediaMap = json['media_info'];
      if(mediaMap != null && mediaMap.isNotEmpty){
        mediaInfo = MediaInfo.fromJson(json['media_info']);
      }
      playCount = json['play_count'];
      pageTitle = json['page_title'];
      content1 = json['content1'];
      content2 = json['content2'];
  }

}


class MediaInfo{
  String name;
  String url;//媒体URL : http://f.video.weibocdn.com/002pSqj5gx07Etu1zRcH01041200fLCb0E010.mp4?label=mp4_ld&template=640x360.25.0&trans_finger=bdef57f06ae52835a2c783ca389e8517&ori=0&ps=1CwnkDw1GXwCQx&Expires=1593526655&ssig=m3pF6VbtsS&KID=unistore,video
  String onlineUsers;//：32万次观看


  MediaInfo.fromJson(Map<String,dynamic> json){
    name = json['name'];
    url = json['stream_url'];
    onlineUsers = json['online_users'];
    

  }
}