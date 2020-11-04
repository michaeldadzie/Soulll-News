import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helpers/news.dart';
import 'package:news_app/widgets/news_tile.dart';

class CategoryNewsScreen extends StatefulWidget {
  // static const routeName = '/category-news';

  final String newsCategory;
  CategoryNewsScreen({this.newsCategory});
  @override
  _CategoryNewsScreenState createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {
  var newsList;
  bool _loading = true;
  // var _loadedInitData = false;
  // String categoryName;

  void getNews() async {
    NewsForCategories news = NewsForCategories();
    await news.getNewsForCategory(widget.newsCategory);
    newsList = news.news;
    setState(() {
      _loading = false;
    });
  }

  // @override
  // void didChangeDependencies() {
  //   if (!_loadedInitData) {
  //     final routeArgs =
  //         ModalRoute.of(context).settings.arguments as Map<String, String>;
  //     categoryName = routeArgs['title'];
  //     _loadedInitData = true;
  //   }
  //   super.didChangeDependencies();
  // }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(categoryName),
          ),
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
