import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneyminded/helper/data.dart';
import 'package:moneyminded/helper/news.dart';
import 'package:moneyminded/models/article_model.dart';
import 'package:moneyminded/models/category_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: deprecated_member_use
  List<CategoryModel> categories = new List<CategoryModel>();
  // ignore: deprecated_member_use
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = new News();
    await newsClass.getNews();
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
            ))
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    //category
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 70,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryCard(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),

                    Container(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: articles.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return BlogTile(
                                imageUrl: articles[index].urlToImage,
                                title: articles[index].title,
                                desc: articles[index].description);
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryCard({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 15),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                categoryName,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String desc;

  BlogTile(
      {@required this.imageUrl, @required this.title, @required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Image.network(imageUrl),
        Text(title),
        Text(desc),
      ],
    ));
  }
}
