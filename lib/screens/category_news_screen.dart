import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/helpers/news.dart';
import 'package:news_app/widgets/news_tile.dart';

class CategoryNewsScreen extends StatefulWidget {
  final String newsCategory;
  CategoryNewsScreen({this.newsCategory});
  @override
  _CategoryNewsScreenState createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {
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
      appBar: AppBar(
        centerTitle: true,
        iconTheme: new IconThemeData(color: Theme.of(context).hintColor),
        title: Text(
          widget.newsCategory,
          style: GoogleFonts.raleway(
              color: Theme.of(context).hintColor, fontSize: 22),
        ),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).hintColor,
              ),
            )
          : Container(
              margin: EdgeInsets.only(top: 16),
              child: ListView.builder(
                itemCount: newsList.length,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
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
    );
  }
}
