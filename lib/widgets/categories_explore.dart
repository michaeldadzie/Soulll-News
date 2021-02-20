import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/category_news_screen.dart';

class CategoryExplore extends StatelessWidget {
  final String imageAssetUrl, categoryName;
  CategoryExplore({this.imageAssetUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => CategoryNewsScreen(
              newsCategory: categoryName.toString(),
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: AssetImage('assets/loading/load.gif'),
              fadeInDuration: Duration(milliseconds: 300),
              image: AssetImage(imageAssetUrl),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              color: Colors.black38,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  categoryName,
                  style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
