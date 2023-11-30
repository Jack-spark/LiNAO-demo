// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news_tab.dart';
import 'profile_tab.dart';
import 'settings_tab.dart';
import 'zhuye_tab.dart';
import 'widgets.dart';
import 'pages/register/register.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: Transform.scale(
          scale: 12.0, // 设置放大倍数
          child: Image.asset('assets/splash_image.png'), // 替换成你的图片路径
        ),
        nextScreen: const MyAdaptingApp(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 3000,
      ),
    );
  }
}

class MyAdaptingApp extends StatelessWidget {
  const MyAdaptingApp({super.key});

  @override
  Widget build(context) {
    // Either Material or Cupertino widgets work in either Material or Cupertino
    // Apps.
    return MaterialApp(
      title: 'Adaptive Music App',
      theme: ThemeData(
        // Use the green theme for Material widgets.
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      builder: (context, child) {
        return CupertinoTheme(
          // Instead of letting Cupertino widgets auto-adapt to the Material
          // theme (which is green), this app will use a different theme
          // for Cupertino (which is blue by default).
          data: const CupertinoThemeData(),
          child: Material(child: child),
        );
      },
      home: const PlatformAdaptingHomePage(),
    );
  }
}

// Shows a different type of scaffold depending on the platform.
//
// This file has the most amount of non-sharable code since it behaves the most
// differently between the platforms.
//
// These differences are also subjective and have more than one 'right' answer
// depending on the app and content.
class PlatformAdaptingHomePage extends StatefulWidget {
  const PlatformAdaptingHomePage({super.key});

  @override
  State<PlatformAdaptingHomePage> createState() =>
      _PlatformAdaptingHomePageState();
}

class _PlatformAdaptingHomePageState extends State<PlatformAdaptingHomePage> {
  // This app keeps a global key for the songs tab because it owns a bunch of
  // data. Since changing platform re-parents those tabs into different
  // scaffolds, keeping a global key to it lets this app keep that tab's data as
  // the platform toggles.
  //
  // This isn't needed for apps that doesn't toggle platforms while running.
  final SongsTabKey = GlobalKey();

  // In Material, this app uses the hamburger menu paradigm and flatly lists
  // all 4 possible tabs. This drawer is injected into the songs tab which is
  // actually building the scaffold around the drawer.
  Widget _buildAndroidHomePage(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            label: '主页',
            icon: Image.asset('assets/zhuye.png'),
            activeIcon: Image.asset(
              'assets/zhuye.png',
              color: Colors.cyan, // 选中颜色
            ),
            // 未选中颜色
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            label: '冥想',
            icon: Image.asset('assets/mingxiang.png'),
            activeIcon: Image.asset(
              'assets/mingxiang.png',
              color: Colors.cyan, // 选中颜色
            ),
            // 未选中颜色
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            label: '课程',
            icon: Image.asset('assets/kecheng.png'),
            activeIcon: Image.asset(
              'assets/kecheng.png',
              color: Colors.cyan, // 选中颜色
            ),
            // 未选中颜色
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            label: '我的',
            icon: Image.asset('assets/wode.png'),
            // 设置选中和未选中状态下的颜色
            // 例如，选中为蓝色，未选中为黑色
            activeIcon: Image.asset(
              'assets/wode.png',
              color: Colors.cyan, // 选中颜色
            ),
            // 未选中颜色
            backgroundColor: Colors.black,
          ),
        ],
      ),
      tabBuilder: (context, index) {
        assert(index <= 3 && index >= 0, 'Unexpected tab index: $index');
        return switch (index) {
          0 => CupertinoTabView(
            defaultTitle: '主页',
            builder: (context) => register(key: SongsTabKey),
          ),
          1 => CupertinoTabView(
            defaultTitle: '冥想',
            builder: (context) => const NewsTab(),
          ),
          2 => CupertinoTabView(
            defaultTitle: '课程',
            builder: (context) => const ProfileTab(),
          ),
          3 => CupertinoTabView(
            defaultTitle: '我的',
            builder: (context) => const ProfileTab(),
          ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  // On iOS, the app uses a bottom tab paradigm. Here, each tab view sits inside
  // a tab in the tab scaffold. The tab scaffold also positions the tab bar
  // in a row at the bottom.
  //
  // An important thing to note is that while a Material Drawer can display a
  // large number of items, a tab bar cannot. To illustrate one way of adjusting
  // for this, the app folds its fourth tab (the settings page) into the
  // third tab. This is a common pattern on iOS.
  Widget _buildIosHomePage(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            label: zhuyeTab.title,
            icon: zhuyeTab.iosIcon,
          ),
          BottomNavigationBarItem(
            label: NewsTab.title,
            icon: NewsTab.iosIcon,
          ),
          BottomNavigationBarItem(
            label: ProfileTab.title,
            icon: ProfileTab.iosIcon,
          ),
          BottomNavigationBarItem(
            label: ProfileTab.title,
            icon: ProfileTab.iosIcon,
          ),
        ],
      ),
      tabBuilder: (context, index) {
        assert(index <= 2 && index >= 0, 'Unexpected tab index: $index');
        return switch (index) {
          0 => CupertinoTabView(
              defaultTitle: zhuyeTab.title,
              builder: (context) => zhuyeTab(),
            ),
          1 => CupertinoTabView(
              defaultTitle: NewsTab.title,
              builder: (context) => const NewsTab(),
            ),
          2 => CupertinoTabView(
              defaultTitle: ProfileTab.title,
              builder: (context) => const ProfileTab(),
            ),
          3 => CupertinoTabView(
            defaultTitle: ProfileTab.title,
            builder: (context) => const ProfileTab(),
          ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroidHomePage,
      iosBuilder: _buildIosHomePage,
    );
  }
}

class _AndroidDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.green),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Icon(
                Icons.account_circle,
                color: Colors.green.shade800,
                size: 96,
              ),
            ),
          ),
          ListTile(
            leading: zhuyeTab.androidIcon,
            title: const Text(zhuyeTab.title),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: NewsTab.androidIcon,
            title: const Text(NewsTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => const NewsTab()));
            },
          ),
          ListTile(
            leading: ProfileTab.androidIcon,
            title: const Text(ProfileTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => const ProfileTab()));
            },
          ),
          ListTile(
            leading: ProfileTab.androidIcon,
            title: const Text(ProfileTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => const ProfileTab()));
            },
          ),
          // Long drawer contents are often segmented.
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          ListTile(
            leading: SettingsTab.androidIcon,
            title: const Text(SettingsTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => const SettingsTab()));
            },
          ),
        ],
      ),
    );
  }
}
