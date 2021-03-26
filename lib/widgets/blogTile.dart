import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneyminded/views/summary_news.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String desc;
  final String url;
  final String content;

  BlogTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.desc,
      @required this.url,
      @required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SummaryNews(
                      url: url,
                      urlToImage: imageUrl,
                      desc: desc,
                      title: title,
                      content: content,
                    )));
      },
      child: Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 16),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  child: Image.network(imageUrl),
                  borderRadius: BorderRadius.circular(6),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  title,
                  //style: TextStyle(color: Colors.black, fontSize: 22),
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(desc, style: TextStyle(color: Colors.black54)),
              ],
            )),
      ),
    );
  }
}
