import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news_app/widgets/article_view.dart';

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, postUrl;
  final DateTime publishedAt;

  NewsTile(
      {this.imgUrl,
      this.desc,
      this.title,
      this.content,
      @required this.postUrl,
      this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ArticleView(
              postUrl: postUrl,
            ),
          ),
        );
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 30),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage(
                        placeholder: AssetImage('assets/loading/load.gif'),
                        image: CachedNetworkImageProvider(
                          imgUrl,
                        ),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    title,
                    maxLines: 2,
                    style: GoogleFonts.raleway(
                        color: Theme.of(context).accentColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style:
                        GoogleFonts.raleway(color: Colors.grey, fontSize: 14),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    Jiffy(publishedAt).fromNow().toString(),
                    style: GoogleFonts.raleway(
                        fontSize: 14, color: Theme.of(context).accentColor),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
