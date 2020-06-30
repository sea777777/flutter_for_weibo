

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
  String vipType;//vip类型 0：红v 皇冠

  WeiBoCard.fromJson(Map<String,dynamic> json){
    itemid = json['itemid'];
    scheme = json['scheme'];
    Map mblog = json['mblog'];
    createAt = mblog['created_at'];
    text = mblog['text'];
    source = mblog['source'];
    user = User.fromJson(mblog['user']);
    repostCount = mblog['reposts_count'];
    commentCount = mblog['comments_count'];
    attCount = mblog['attitudes_count'];
    rawText = mblog['raw_text'];
    vipType = mblog['mblog_vip_type'];
  }

  //解析 list
  static List<WeiBoCard> fromListJson(Map<String,dynamic> json){
    Map<String, dynamic> data = json['data'];
    List dataCards =  data['cards'];
    List<WeiBoCard> cards = new List();
    for (var cardjson in dataCards) {
      WeiBoCard card = WeiBoCard.fromJson(cardjson);
      cards.add(card);
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
  String type;//vide 、
  MediaInfo mediaInfo;//多媒体信息 视频 图片

  PageInfo.fromJson(Map<String,dynamic> json){

  }

}


class MediaInfo{


  MediaInfo.fromJson(Map<String,dynamic> json){

  }
}