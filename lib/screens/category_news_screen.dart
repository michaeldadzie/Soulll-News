import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/helpers/news.dart';
import 'package:news_app/widgets/explore_news_tile.dart';
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          widget.newsCategory,
          style: GoogleFonts.raleway(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor),
        ),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).hintColor,
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                child: ListView.builder(
                  itemCount: newsList.length,
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemBuilder: (context, index) {
                    return ExploreNewsTile(
                      imgUrl: newsList[index].urlToImage ?? "",
                      title: newsList[index].title ?? "",
                      desc: newsList[index].description ?? "",
                      content: newsList[index].content ?? "",
                      postUrl: newsList[index].articleUrl ?? "",
                      author: newsList[index].author ?? "",
                    );
                  },
                ),
              ),
            ),
    );
  }
}
