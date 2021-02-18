import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/article.dart';
import 'dart:convert';
import 'package:news_app/secret.dart';

class News with ChangeNotifier {
  List<Article> news = [];
  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=$apiKey";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    try {
      if (jsonData['status'] == "ok") {
        jsonData["articles"].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            Article article = Article(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              publishedAt: DateTime.parse(element['publishedAt']),
              content: element["content"],
              articleUrl: element["url"],
            );
            news.add(article);
          }
        });
      }
    } catch (error) {
      print(error);
    }
  }
}

class NewsForCategories {
  List<Article> news = [];

  Future<void> getNewsForCategory(String category) async {
    String url = "http://newsapi.org/v2/everything?q=$category&apiKey=$apiKey";
    // String url =
    //     "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$apiKey";
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    try {
      if (jsonData['status'] == "ok") {
        jsonData["articles"].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            Article article = Article(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              publishedAt: DateTime.parse(element['publishedAt']),
              content: element["content"],
              articleUrl: element["url"],
            );
            news.add(article);
          }
        });
      }
    } catch (error) {
      print(error);
    }
  }
}
