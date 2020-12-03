import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/category_news_screen.dart';
import 'package:page_transition/page_transition.dart';

class CategoryExplore extends StatelessWidget {
  final String imageAssetUrl, categoryName;
  CategoryExplore({this.imageAssetUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child: CategoryNewsScreen(
                    newsCategory: categoryName.toString(),
                  ),
                  type: PageTransitionType.rightToLeftWithFade));
        },
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              height: 40,
              width: 40,
              child: Image.network(
                imageAssetUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(
            categoryName,
            style: GoogleFonts.raleway(
                color: Theme.of(context).accentColor, fontSize: 20),
          ),
        )
        // Container(
        //   margin: EdgeInsets.all(10),
        //   child: Stack(
        //     children: <Widget>[
        //       ClipRRect(
        //         borderRadius: BorderRadius.circular(5),
        //         child: CachedNetworkImage(
        //           imageUrl: imageAssetUrl,
        //           height: 150,
        //           width: MediaQuery.of(context).size.width,
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //       Container(
        //         alignment: Alignment.center,
        //         height: 150,
        //         width: MediaQuery.of(context).size.width,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(5),
        //           color: Colors.black26,
        //         ),
        //         child: Text(
        //           categoryName,
        //           textAlign: TextAlign.center,
        //           style: GoogleFonts.raleway(
        //             color: Colors.white,
        //             fontSize: 30,
        //             fontWeight: FontWeight.w300,
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        );
  }
}
