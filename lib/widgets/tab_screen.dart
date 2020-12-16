import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:news_app/screens/explore_screen.dart';
import 'package:news_app/screens/audio_screen.dart';
import 'package:news_app/screens/home_screen.dart';
import 'nav_bar_item.dart';
import 'bottom_nav_bar.dart';

class TabScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TabScreenState();
}

class TabScreenState extends State<TabScreen> {
  static int currentTab = 0;
  final ScrollController _scrollController = ScrollController();

  final List<TabItem> tabs = [
    TabItem(
      tabName: "Today",
      icon: Icons.home,
      page: HomeScreen(),
    ),
    TabItem(
      tabName: "Explore",
      icon: MaterialCommunityIcons.newspaper,
      page: ExploreScreen(),
    ),
    TabItem(
      tabName: "Listen Now",
      icon: MaterialCommunityIcons.headphones,
      page: AudioNews(),
    ),
  ];

  TabScreenState() {
    tabs.asMap().forEach((index, details) {
      details.setIndex(index);
    });
  }

  void _selectTab(int index) {
    if (index == currentTab) {
      tabs[index].key.currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => currentTab = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await tabs[currentTab].key.currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (currentTab != 0) {
            _selectTab(0);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: IndexedStack(
          index: currentTab,
          children: tabs.map((e) => e.page).toList(),
        ),
        bottomNavigationBar: BottomNavigation(
          onSelectTab: _selectTab,
          tabs: tabs,
        ),
      ),
    );
  }
}
