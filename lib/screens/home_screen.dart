import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/data.dart';
import 'package:news_app/providers/news_provder.dart';
import 'package:news_app/services/news.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/widgets/news_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading;
  List newsList;
  News news = News();

  void getNews() async {
    await news.getNews();
    newsList = news.news;
    setState(() {
      _loading = false;
    });
  }

  // NewsProvider get provider {
  //   return Provider.of<NewsProvider>(context, listen: false);
  // }

  @override
  void initState() {
    _loading = true;
    super.initState();
    getNews();
    // provider.getNews(loading);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                Text(
                  'News',
                  style: GoogleFonts.raleway(
                      color: Theme.of(context).accentColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  DateFormat.MMMMd().format(DateTime.now()),
                  style: GoogleFonts.raleway(
                    color: Colors.grey,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(color: Colors.grey),
                SizedBox(height: 10),
                Text(
                  'Top Stories',
                  style: GoogleFonts.raleway(
                      color: Theme.of(context).hintColor,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                _loading
                    ? Container(
                        height: MediaQuery.of(context).size.height - 250,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Theme.of(context).hintColor,
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(top: 10),
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
                              publishedAt: newsList[index].publishedAt ?? "",
                            );
                          },
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
