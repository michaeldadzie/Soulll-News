import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news_app/widgets/article_view.dart';

class ExploreNewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, postUrl, author;
  final DateTime publishedAt;

  ExploreNewsTile({
    this.imgUrl,
    this.desc,
    this.title,
    this.content,
    @required this.postUrl,
    this.publishedAt,
    this.author,
  });

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
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 160,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 170,
                  top: 0,
                  bottom: 40,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.raleway(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor),
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 200,
                    top: 120,
                    bottom: 0,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            author,
                            style: GoogleFonts.raleway(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Text(
                            Jiffy(publishedAt).fromNow().toString(),
                            style: GoogleFonts.raleway(
                                fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  left: 200,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                        child: FadeInImage(
                      placeholder: AssetImage('assets/loading/load.gif'),
                      image: CachedNetworkImageProvider(
                        imgUrl,
                      ),
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        )
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   child: Container(
        //     child: Container(
        //       padding: EdgeInsets.only(bottom: 20),
        //       alignment: Alignment.bottomCenter,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.only(
        //               bottomRight: Radius.circular(6),
        //               bottomLeft: Radius.circular(6))),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisSize: MainAxisSize.min,
        //         children: <Widget>[
        //           ClipRRect(
        //               borderRadius: BorderRadius.circular(6),
        //               child: FadeInImage(
        //                 placeholder: AssetImage('assets/loading/load.gif'),
        //                 image: CachedNetworkImageProvider(
        //                   imgUrl,
        //                 ),
        //                 height: 200,
        //                 width: MediaQuery.of(context).size.width,
        //                 fit: BoxFit.cover,
        //               )),
        //           SizedBox(
        //             height: 12,
        //           ),
        //           Text(
        //             title,
        //             maxLines: 2,
        //             style: GoogleFonts.raleway(
        //                 color: Theme.of(context).accentColor,
        //                 fontSize: 20,
        //                 fontWeight: FontWeight.w500),
        //           ),
        //           SizedBox(
        //             height: 4,
        //           ),
        //           Text(
        //             desc,
        //             maxLines: 2,
        //             style: GoogleFonts.raleway(color: Colors.grey, fontSize: 14),
        //           ),
        //           SizedBox(
        //             height: 4,
        //           ),
        //           Text(
        //             Jiffy(publishedAt).fromNow().toString(),
        //             style: GoogleFonts.raleway(
        //                 fontSize: 14, color: Theme.of(context).accentColor),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
