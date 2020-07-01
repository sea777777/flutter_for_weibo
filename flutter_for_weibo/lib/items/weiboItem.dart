import 'package:flutter/material.dart';
import 'package:flutter_for_weibo/models/WeiBoCard.dart';


class WeiboItem extends StatelessWidget {

  final WeiBoCard data;

  const WeiboItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.all(16),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Image.network(
                    '${data.user.profileImgUrl}',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                ),
                Text(
                  '${data.user.screenName}',
                    maxLines: 20,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Row(
              children: <Widget>[
                Text(
                    '${data.rawText}',
                    maxLines: 20,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF333333),
                    ),
                ),
              ],
            ),
          ],
        ),
      ),      
    );
  }
}

