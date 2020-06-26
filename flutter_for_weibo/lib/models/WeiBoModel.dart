

class WeiBoModel{

  List cards;
  //to do : card info 

  WeiBoModel.fromJson(Map<String, dynamic> json){
    Map<String, dynamic> data = json['data'];
    List dataCards =  data['cards'];
    cards = new List();
    for (var cardjson in dataCards) {
      WeiBoCard card = WeiBoCard.fromJson(cardjson);
      cards.add(card);
    }
  }


}

class WeiBoCard{
  String itemid ;
  String scheme;//微博详情链接
  String createAt;//创建时间
  String text;//微博的文字部分（包含HTML标签）
  String source;//发布微博的源
  Map user; //用户信息
  int repostCount;//转发数
  int commentCount;//评论数
  int attCount;//赞👍数量

  WeiBoCard.fromJson(Map<String,dynamic> json){
    itemid = json['itemid'];
    scheme = json['scheme'];
    Map mblog = json['mblog'];
    createAt = mblog['created_at'];
    text = mblog['text'];
    source = mblog['source'];
    user = mblog['user'];
    repostCount = mblog['reposts_count'];
    commentCount = mblog['comments_count'];
    attCount = mblog['attitudes_count'];


  }
}