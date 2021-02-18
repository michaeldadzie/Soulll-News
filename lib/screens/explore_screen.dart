import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/data.dart';
import 'package:news_app/services/news.dart';
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
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Topics',
          style: GoogleFonts.raleway(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).accentColor),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: GridView.builder(
            padding: const EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 3 / 2,
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoryExplore(
                imageAssetUrl: categories[index].imageAssetUrl,
                categoryName: categories[index].categoryName,
              );
            },
          ),
        ),
      ),
    );
  }
}
