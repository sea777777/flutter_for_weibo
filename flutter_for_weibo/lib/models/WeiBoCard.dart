

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
  String rawText;//源文本

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
    rawText = mblog['raw_text'];
    // print(itemid);
    // print(rawText);
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
    int i = this.hashCode;
    int j = other.hashCode;
    bool b = this.hashCode == other.hashCode;
    return this.hashCode == other.hashCode;
  }
  
  //微博数据拉下来会重复，所以用itemid作为唯一标示
  @override
  int get hashCode {
    int index = this.itemid.lastIndexOf('_');
    String itemCode = this.itemid.substring(index+1);
    int i = int.tryParse(itemCode) ?? -1;
    return i;
  }
  
}