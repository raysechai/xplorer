import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing2/screens/bookmark_screen.dart';
import 'package:testing2/screens/explore_screen.dart';
import 'package:testing2/screens/filter_screen.dart';
import 'package:testing2/screens/my_plan.dart';

class HomeScreen extends StatefulWidget {
  static String get id => null;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          FilterScreen(),
          ExploreScreen(),
          BookmarkScreen(),
          MyPlanScreen(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentTab,
        onTap: (int index) { 
          setState(() {
            _currentTab = index;
          });
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
        activeColor: Colors.blueAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 32.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
              size: 32.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border,
              size: 32.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.date_range,
              size: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}
