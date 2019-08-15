import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/my_page.dart';
import 'package:flutter_app/pages/search_page.dart';
import 'package:flutter_app/pages/travel_page.dart';




class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {


  // 记录当前页面索引
  int _currentPageIndex;
  // 底部导航栏组件
  BottomNavigationBarItem _bottomItem(String title,Icon icon) {
    return BottomNavigationBarItem(
      title: Text(title),
      icon: icon,
    );
  }
  // 页面导航数组
  List<Widget> _navPageList = [
    HomePage(),
    SearchPage(),
    TravelPage(),
    MyPage(),
  ];

  @override
  void initState() {
    _currentPageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: _navPageList[_currentPageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        currentIndex: _currentPageIndex,
        items:<BottomNavigationBarItem> [
          _bottomItem('首页', Icon(Icons.home)),
          _bottomItem('搜索', Icon(Icons.search)),
          _bottomItem('旅拍', Icon(Icons.camera_alt)),
          _bottomItem('我的', Icon(Icons.account_circle)),
        ],
      ),
    );
  }
}


