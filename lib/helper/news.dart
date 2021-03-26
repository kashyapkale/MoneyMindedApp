import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moneyminded/models/article_model.dart';

class News {
  // ignore: deprecated_member_use
  List<ArticleModel> news = new List<ArticleModel>();

  Future<void> getNews() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=31646f377be84c1f860dc468710d36d0");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = new ArticleModel(
              title: element["title"],
              description: element["description"],
              author: element["author"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"]);
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNews {
  // ignore: deprecated_member_use
  List<ArticleModel> news = new List<ArticleModel>();

  Future<void> getNews(String category) async {
    var url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=31646f377be84c1f860dc468710d36d0");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = new ArticleModel(
              title: element["title"],
              description: element["description"],
              author: element["author"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"]);
          news.add(articleModel);
        }
      });
    }
  }
}
