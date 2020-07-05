import 'package:flutter/material.dart';

import 'package:flutter_for_weibo/models/WeiBoCard.dart';

//多媒体组件： 文本 图片 视频
class WBMediaWidget extends StatelessWidget {
  const WBMediaWidget({Key key, this.data}) : super(key: key);
  final WeiBoCard data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '${this.data.rawText == null ? this.data.text :this.data.rawText}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 5)),
          WBPicturesWidget(list: this.data.pics),
        ],
      ),
    );
  }
}

class WBPicturesWidget extends StatelessWidget {
  List<Map<String, String>> list;

  WBPicturesWidget({
    Key key,
    this.list,
  }) : super(key: key);

  void showPhoto(BuildContext context, Map<String, String> img) {
    Navigator.push(context,
        MaterialPageRoute<void>(builder: (BuildContext context) {
      return GestureDetector(
        child: SizedBox.expand(
          child: Hero(
            tag: img['pid'],
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF000000),
                image: DecorationImage(
                    fit: BoxFit.contain, image: NetworkImage('${img['url']}')),
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.maybePop(context);
        },
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    int _crossAxisCount = 3;
    if (this.list == null || this.list.length == 0) {
      return Container();
    }
    if (this.list.length == 4) {
      _crossAxisCount = 2;
    }

    return GridView.count(
      crossAxisCount: _crossAxisCount,
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
      shrinkWrap: true,
      physics: new NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(4.0),
      children: this.list.map(
        (Map<String, String> img) {
          return GestureDetector(
            onTap: () {
              showPhoto(context, img);
            },
            child: Hero(
              tag: img['pid'],
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage('${img['url']}')),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
