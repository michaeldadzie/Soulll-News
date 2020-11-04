import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/widgets/article_view.dart';

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, postUrl;

  NewsTile(
      {this.imgUrl,
      this.desc,
      this.title,
      this.content,
      @required this.postUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              postUrl: postUrl,
            ),
          ),
        );
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: FadeInImage(
                        placeholder: AssetImage('assets/loading/load.gif'),
                        image: NetworkImage(
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
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
