import 'package:news_app/models/article.dart';
import 'package:news_app/providers/base_provider.dart';
import 'package:news_app/services/news.dart';

class NewsProvider extends BaseProvider {
  List<Article> _allNews = [];
  News news = News();

  List<Article> get newsList => _allNews;

  void getNews(bool isLoading) async {
    await news.getNews();
    _allNews = news.news;
    isLoading = false;
    notifyListeners();
  }
}
