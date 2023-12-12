import 'package:flutter/cupertino.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/meditationPage.dart';

import '../pages/homePage.dart';
import '../widgets.dart';
import '../module/register/register.dart';
import '../pages/coursePage.dart';
import '../pages/userPage.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    zhuyeTab(),
    mingxiangTab(),
    CourseTab(),
    UserTab(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Your content here based on the selected index
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: Colors.white,
        // 设置底部导航栏背景颜色
        selectedItemColor: Colors.cyan,
        // 选中项颜色
        unselectedItemColor: Colors.black,
        // 未选中项颜色
        selectedLabelStyle: TextStyle(color: Colors.cyan),
        // 选中状态下标签文字颜色
        unselectedLabelStyle: TextStyle(color: Colors.black),
        items: [
          BottomNavigationBarItem(
            label: '主页',
            icon: Column(
              children: [
                Image.asset(
                  'assets/zhuye.png',
                  width: 81 / 3.5,
                  height: 96 / 3.5,
                ),
                Text('主页'),
              ],
            ),
            activeIcon: Image.asset(
              'assets/zhuye.png',
              color: Colors.cyan,
              width: 81 / 3.5,
              height: 96 / 3.5, // 选中颜色
            ),
            // 未选中颜色
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            label: '冥想',
            icon: Column(
              children: [
                Image.asset(
                  'assets/mingxiang.png',
                  width: 81 / 3.5,
                  height: 96 / 3.5,
                ),
                Text('冥想'),
              ],
            ),
            activeIcon: Image.asset(
              'assets/mingxiang.png',
              color: Colors.cyan,
              width: 81 / 3.5,
              height: 96 / 3.5, // 选中颜色
            ),
            // 未选中颜色
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            label: '课程',
            icon: Column(
              children: [
                Image.asset(
                  'assets/kecheng.png',
                  width: 81 / 3.5,
                  height: 96 / 3.5,
                ),
                Text('课程'),
              ],
            ),
            activeIcon: Image.asset(
              'assets/kecheng.png',
              color: Colors.cyan,
              width: 81 / 3.5,
              height: 96 / 3.5, // 选中颜色
            ),
            // 未选中颜色
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            label: '我的',
            icon: Column(
              children: [
                Image.asset(
                  'assets/wode.png',
                  width: 81 / 3.5,
                  height: 96 / 3.5,
                ),
                Text('我的'),
              ],
            ),
            // 设置选中和未选中状态下的颜色
            // 例如，选中为蓝色，未选中为黑色
            activeIcon: Image.asset(
              'assets/wode.png',
              color: Colors.cyan,
              width: 81 / 3.5,
              height: 96 / 3.5, // 选中颜色
            ),
            // 未选中颜色
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
