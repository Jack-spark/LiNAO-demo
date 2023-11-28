// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'zhuye_detail_tab.dart';
import 'utils.dart';
import 'widgets.dart';
import 'zujian/hengchoutidaixiabiao.dart';
import 'zujian/hengchouti.dart';
import 'zujian/tuoyuananniu.dart';

class ChallengeDetailPage extends StatelessWidget {
  final String title;

  ChallengeDetailPage({required this.title});

  @override
  Widget build(BuildContext context) {
    // 页面的构建逻辑
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        // 页面内容
      ),
    );
  }
}

class zhuyeTab extends StatefulWidget {
  static const title = 'Songs';
  static const androidIcon = Icon(Icons.music_note);
  static const iosIcon = Icon(CupertinoIcons.music_note);

  const zhuyeTab({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  @override
  State<zhuyeTab> createState() => _zhuyeTabState();
}

class _zhuyeTabState extends State<zhuyeTab> {
  final List<String> buttonLabels = ['', ''];
  List<String> buttonImagePaths = [
    'assets/a1.png',
    'assets/a2.png',
    // 添加更多按钮的图标数据
  ];
  List<Widget> ButtonDetailPage = [

  ];


  static const _itemsLength = 50;

  final _androidRefreshKey = GlobalKey<RefreshIndicatorState>();

  late List<MaterialColor> colors;
  late List<String> songNames;

  @override
  void initState() {
    _setData();
    super.initState();
  }

  void _setData() {
    colors = getRandomColors(_itemsLength);
    songNames = getRandomNames(_itemsLength);
  }

  Future<void> _refreshData() {
    return Future.delayed(
      // This is just an arbitrary delay that simulates some network activity.
      const Duration(seconds: 2),
      () => setState(() => _setData()),
    );
  }

  Widget _listBuilder(BuildContext context, int index) {
    if (index >= _itemsLength) return Container();

    // Show a slightly different color palette. Show poppy-ier colors on iOS
    // due to lighter contrasting bars and tone it down on Android.
    final color = defaultTargetPlatform == TargetPlatform.iOS
        ? colors[index]
        : colors[index].shade400;

    return SafeArea(
      top: false,
      bottom: false,
      child: Hero(
        tag: index,
        child: HeroAnimatingSongCard(
          song: songNames[index],
          color: color,
          heroAnimation: const AlwaysStoppedAnimation(0),
          onPressed: () => Navigator.of(context).push<void>(
            MaterialPageRoute(
              builder: (context) => zhuyeDetailTab(
                id: index,
                song: songNames[index],
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePlatform() {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
    } else {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    }

    // This rebuilds the application. This should obviously never be
    // done in a real app but it's done here since this app
    // unrealistically toggles the current platform for demonstration
    // purposes.
    WidgetsBinding.instance.reassembleApplication();
  }

  // ===========================================================================
  // Non-shared code below because:
  // - Android and iOS have different scaffolds
  // - There are different items in the app bar / nav bar
  // - Android has a hamburger drawer, iOS has bottom tabs
  // - The iOS nav bar is scrollable, Android is not
  // - Pull-to-refresh works differently, and Android has a button to trigger it too
  //
  // And these are all design time choices that doesn't have a single 'right'
  // answer.
  // ===========================================================================
  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/linao.png', width: 100, height: 100), // 可以设置图像的宽高
            const SizedBox(width: 8), // 适当调整图像和文本之间的间距
            const Text('正念冥想'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async =>
                await _androidRefreshKey.currentState!.show(),
          ),
          IconButton(
            icon: const Icon(Icons.shuffle),
            onPressed: _togglePlatform,
          ),
        ],
      ),
      drawer: widget.androidDrawer,
      body: SafeArea(
        bottom: true,
        child:SingleChildScrollView(
          child:Column(
            children: [
              Container(
                // width: 300,
                // height: 200,
                child: CustomButtonDrawer1(
                  buttonLabels: [
                    '',
                    '',
                    '',
                  ],
                  buttonImagePaths: [
                    'assets/a1.png',
                    'assets/a2.png',
                    'assets/a3.png',
                  ],
                  buttonDetailPages: [

                  ],
                ),
              ),
              OvalButton(
                onPressed: () {
                  // 第一个按钮被点击时执行的操作
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '头环未连接，进入连接指引  ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Image.asset(
                      'assets/touhuan.png',
                      width: 60, // 调整图标的宽度
                      height: 60, // 调整图标的高度
                    ),
                  ],
                ),
                width: 350,
                height: 50,
                color: Colors.cyan,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 8),
                  Container(
                    width: 4, // 竖线的宽度
                    height: 20, // 竖线的高度
                    color: Colors.black, // 竖线的颜色
                    margin: EdgeInsets.only(top: 8, bottom: 8, right: 8), // 控制竖线与文字的间距
                  ),
                  Text(
                    '为你推荐',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 1),
              Container(
                // width: 300,
                // height: 200,
                child: CustomButtonDrawer(
                  buttonLabels: [
                    '',
                    '',
                    '',
                  ],
                  buttonImagePaths: [
                    'assets/b1.png',
                    'assets/b2.png',
                    'assets/b2.png',
                  ],
                  buttonDetailPages: [

                  ],
                ),
              ),
              SizedBox(height: 1),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 8),
                  Container(
                    width: 4, // 竖线的宽度
                    height: 20, // 竖线的高度
                    color: Colors.black, // 竖线的颜色
                    margin: EdgeInsets.only(top: 8, bottom: 8, right: 8), // 控制竖线与文字的间距
                  ),
                  Text(
                    '多人冥想',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 1),
              Row(
                children: [
                  SizedBox(width: 40),

                  OvalButton(
                    onPressed: () {
                      // 第一个按钮被点击时执行的操作
                    },
                    child: Text(
                      '创建房间',
                      style: TextStyle(color: Colors.white),
                    ),
                    width: 150,
                    height: 50,
                    color: Colors.cyan,
                  ),

                  SizedBox(width: 30), // 适当的间距

                  OvalButton(
                    onPressed: () {
                      // 第二个按钮被点击时执行的操作
                    },
                    child: Text(
                      '加入房间',
                      style: TextStyle(color: Colors.white),
                    ),
                    width: 150,
                    height: 50,
                    color: Colors.cyan,
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: _togglePlatform,
            child: const Icon(CupertinoIcons.shuffle),
          ),
        ),
        CupertinoSliverRefreshControl(
          onRefresh: _refreshData,
        ),
        SliverSafeArea(
          top: false,
          sliver: SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                _listBuilder,
                childCount: _itemsLength,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
