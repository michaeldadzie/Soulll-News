import 'dart:async';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    String url = widget.postUrl;
    String subject = "Share";
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WebView(
            initialUrl: widget.postUrl,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.share,
          color: Theme.of(context).hintColor,
        ),
        onPressed: () {
          final RenderBox box = context.findRenderObject();
          Share.share(url,
              subject: subject,
              sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
        },
      ),
    );
  }
}
