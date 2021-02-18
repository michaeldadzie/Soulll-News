import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share/share.dart';

class ArticleView extends StatefulWidget {
  final String postUrl;
  ArticleView({this.postUrl});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isScrollingDown = false;

  Future<String> get _url async {
    await Future.delayed(Duration(seconds: 2));
    return widget.postUrl;
  }

  @override
  Widget build(BuildContext context) {
    String url = widget.postUrl;
    String subject = "Share News Article";
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                final RenderBox box = context.findRenderObject();
                Share.share(url,
                    subject: subject,
                    sharePositionOrigin:
                        box.localToGlobal(Offset.zero) & box.size);
              },
              child: Text(
                'Share Now',
                style: GoogleFonts.raleway(
                    color: Theme.of(context).accentColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          FutureBuilder(
            future: _url,
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                snapshot.hasData
                    ? SafeArea(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: WebView(
                            initialUrl: widget.postUrl,
                            onWebViewCreated:
                                (WebViewController webViewController) {
                              _controller.complete(webViewController);
                            },
                          ),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.green,
                        ),
                      ),
          ),
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   top: 0,
          //   child: AppBar(
          //     backgroundColor: Colors.transparent,
          //     iconTheme: IconThemeData(color: Colors.green),
          //     // leading: MaterialButton(
          //     //   child: Icon(Icons.arrow_back_ios,color: Colors.green,),
          //     //   shape: CircleBorder(),
          //     //   color: Colors.white,
          //     //   elevation: 1,
          //     // ),
          //   ),
          // )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   child: Icon(
      //     Icons.share,
      //     color: Theme.of(context).hintColor,
      //   ),
      //   onPressed: () {
      //     final RenderBox box = context.findRenderObject();
      //     Share.share(url,
      //         subject: subject,
      //         sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
      //   },
      // ),
    );
  }
}
