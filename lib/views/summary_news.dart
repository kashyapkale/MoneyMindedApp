import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'article_view.dart';

class SummaryNews extends StatefulWidget {
  final String title;
  final String desc;
  final String urlToImage;
  final String url;
  final String content;

  SummaryNews(
      {@required this.title,
      @required this.desc,
      @required this.urlToImage,
      @required this.url,
      @required this.content});

  @override
  _SummaryNewsState createState() => _SummaryNewsState();
}

class _SummaryNewsState extends State<SummaryNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Image.network(
                widget.urlToImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 250,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              width: MediaQuery.of(context).size.width,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      widget.content,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticleView(
                        blogUrl: widget.url,
                      )));
        },
        label: const Text('Read Full Article'),
        icon: const Icon(Icons.book),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
