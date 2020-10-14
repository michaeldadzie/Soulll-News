import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/widgets/main_drawer.dart';
import '../screens/home_screen.dart';
import '../screens/explore_screen.dart';
import '../screens/favorites_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  Widget get menuButton {
    final color = Theme.of(context).hintColor;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 3, width: 12, color: color),
          SizedBox(height: 7),
          Container(height: 3, width: 24, color: color),
        ],
      ),
    );
  }

  int _selectedPageIndex = 0;
  List<Map<String, Object>> _pages;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _pages = [
      {'page': HomeScreen(), 'title': 'Soulll News'},
      {'page': ExploreScreen(), 'title': 'Explore'},
      {'page': FavoritesScreen(), 'title': 'Favorites'},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            middle: Text(
              _pages[_selectedPageIndex]['title'],
              style: GoogleFonts.raleway(
                  color: Theme.of(context).hintColor, fontSize: 22),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    CupertinoIcons.ellipsis_vertical,
                    color: Theme.of(context).hintColor,
                  ),
                )
              ],
            ),
            actionsForegroundColor: Theme.of(context).hintColor,
          )
        : AppBar(
            centerTitle: true,
            title: Text(
              _pages[_selectedPageIndex]['title'],
              style: GoogleFonts.raleway(
                  color: Theme.of(context).hintColor, fontSize: 22),
            ),
            leading: IconButton(
              icon: menuButton,
              onPressed: () => scaffoldKey.currentState.openDrawer(),
            ),
            iconTheme: new IconThemeData(color: Theme.of(context).hintColor),
          );
    final tabBar = Platform.isIOS
        ? CupertinoTabBar(
            backgroundColor: Theme.of(context).primaryColor,
            currentIndex: _selectedPageIndex,
            onTap: _selectPage,
            inactiveColor: Theme.of(context).accentColor,
            iconSize: 25,
            activeColor: Theme.of(context).hintColor,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(CupertinoIcons.home),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(CupertinoIcons.news),
                label: 'Explore'
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(CupertinoIcons.heart),
                label: 'Favorites'
              ),
            ],
          )
        : BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            currentIndex: _selectedPageIndex,
            onTap: _selectPage,
            unselectedItemColor: Theme.of(context).accentColor,
            selectedItemColor: Theme.of(context).hintColor,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 25,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(MaterialCommunityIcons.home_outline),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(MaterialCommunityIcons.newspaper),
                label: 'Explore'
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(MaterialCommunityIcons.heart_outline),
                label: 'Favorites'
              ),
            ],
          );
    return Platform.isIOS
        ? CupertinoTabScaffold(
            tabBar: tabBar,
            tabBuilder: (context, index) {
              return CupertinoPageScaffold(
                navigationBar: appBar,
                child: _pages[_selectedPageIndex]['page'],
              );
            },
          )
        : Scaffold(
            key: scaffoldKey,
            appBar: appBar,
            drawer: MainDrawer(),
            body: _pages[_selectedPageIndex]['page'],
            bottomNavigationBar: tabBar,
          );
  }
}
