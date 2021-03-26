import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneyminded/helper/news.dart';
import 'package:moneyminded/models/article_model.dart';
import 'package:moneyminded/widgets/blogTile.dart';

class CategoryNewsDisplay extends StatefulWidget {
  final String category;
  CategoryNewsDisplay({this.category});
  @override
  _CategoryNewsDisplayState createState() => _CategoryNewsDisplayState();
}

class _CategoryNewsDisplayState extends State<CategoryNewsDisplay> {
  // ignore: deprecated_member_use
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    CategoryNews newsClass = new CategoryNews();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    print(articles);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Money",
              style: TextStyle(
                  color: Colors.yellow[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Text("Minded",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
          ],
        ),
        elevation: 0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          itemCount: articles.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                              url: articles[index].url,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
