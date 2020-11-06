import 'package:flutter/material.dart';
import 'package:news_app/helpers/data.dart';
import 'package:news_app/helpers/news.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/widgets/category_card.dart';
import 'package:news_app/widgets/news_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Future<void> _refreshArticles(BuildContext context) async {
  await Provider.of<News>(context, listen: false).getNews();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading;
  var newsList;

  List<CategoryModel> categories = List<CategoryModel>();

  void getNews() async {
    News news = News();
    await news.getNews();
    newsList = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();

    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _loading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).hintColor,
              ),
            )
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            imageAssetUrl: categories[index].imageAssetUrl,
                            categoryName: categories[index].categoryName,
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
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
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
