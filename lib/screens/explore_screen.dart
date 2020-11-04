import 'package:flutter/material.dart';
import 'package:news_app/helpers/data.dart';
import 'package:news_app/helpers/news.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/widgets/categories_explore.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  bool _loading;
  var newsList;
  @override
  void initState() {
    _loading = true;
    super.initState();

    categories = getCategories();
    getNews();
  }

  void getNews() async {
    News news = News();
    await news.getNews();
    newsList = news.news;
    setState(() {
      _loading = false;
    });
  }

  List<CategoryModel> categories = List<CategoryModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).hintColor),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                height: MediaQuery.of(context).size.height - 130,
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryExplore(
                      imageAssetUrl: categories[index].imageAssetUrl,
                      categoryName: categories[index].categoryName,
                    );
                  },
                ),
              ),
              physics: ClampingScrollPhysics(),
            ),
    );
  }
}
