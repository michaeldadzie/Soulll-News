import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helpers/news.dart';
import 'package:news_app/widgets/news_tile.dart';

class CategoryNews extends StatefulWidget {
  final String newsCategory;
  CategoryNews({this.newsCategory});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var newsList;
  bool _loading = true;

  void getNews() async {
    NewsForCategories news = NewsForCategories();
    await news.getNewsForCategory(widget.newsCategory);
    newsList = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).hintColor,
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  child: ListView.builder(
                    itemCount: newsList.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsTile(
                        imgUrl: newsList[index].urlToImage ?? "",
                        title: newsList[index].title ?? "",
                        desc: newsList[index].description ?? "",
                        content: newsList[index].content ?? "",
                        postUrl: newsList[index].articleUrl ?? "",
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
