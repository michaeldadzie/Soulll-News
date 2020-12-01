import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nav_bar_item.dart';
import 'tab_screen.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    this.onSelectTab,
    this.tabs,
  });
  final ValueChanged<int> onSelectTab;
  final List<TabItem> tabs;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        items: tabs
            .map(
              (e) => _buildItem(
                index: e.getIndex(),
                icon: e.icon,
                tabName: e.tabName,
              ),
            )
            .toList(),
        onTap: (index) => onSelectTab(
          index,
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem(
      {int index, IconData icon, String tabName}) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _tabColor(index: index),
      ),
      title: Text(
        tabName,
        style: GoogleFonts.raleway(
          color: _tabColor(index: index),
          fontSize: 12,
        ),
      ),
    );
  }

  Color _tabColor({int index}) {
    return TabScreenState.currentTab == index ? Colors.green : Colors.grey;
  }
}
