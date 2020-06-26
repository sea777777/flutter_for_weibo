import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/models/WeiBoModel.dart';


class weiboItem extends StatelessWidget {

  final WeiBoModel data;

  const weiboItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '标题+++++',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0x000000),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 3)),
                Row(
                  children: <Widget>[
                    Text(
                      '文本++++++++++++',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0x000000),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 16)),
          Image.network(
            'https://wx3.sinaimg.cn/mw690/ac593e95ly1gg1bk1xchjj20qo0qon1g.jpg',
            width: 100,
            height: 60,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class NewsViewModel {
  /// 新闻标题
  final String title;

  /// 来源
  final String source;

  /// 评论数量
  final int comments;

  /// 新闻配图
  final String coverImgUrl;

  const NewsViewModel({
    this.title,
    this.source,
    this.comments,
    this.coverImgUrl,
  });
}
