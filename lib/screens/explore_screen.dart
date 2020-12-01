import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 100,
          pinned: true,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Topics',
              style: GoogleFonts.raleway(
                  color: Theme.of(context).hintColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            titlePadding: EdgeInsets.only(left: 20),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryExplore(
                    imageAssetUrl: categories[index].imageAssetUrl,
                    categoryName: categories[index].categoryName,
                  );
                },
              ),
            ),
          ]),
        )
      ],
    ));
  }
}
