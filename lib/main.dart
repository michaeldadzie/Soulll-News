import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/widgets/tabscreen.dart';
import 'package:news_app/services/news.dart';
import 'package:provider/provider.dart';
import 'utils/const.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent, // status bar color
    ),
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: News(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Soulll News',
        theme: Constants.lightTheme,
        darkTheme: Constants.darkTheme,
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabScreen(),
        },
        onUnknownRoute: (settings) {
          return CupertinoPageRoute(
            builder: (ctx) => TabScreen(),
          );
        },
      ),
    );
  }
}
