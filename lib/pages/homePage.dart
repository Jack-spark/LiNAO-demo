// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by readme BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';
import '../component/slider/rowSubscriptedSlider.dart';
import '../component/slider/rowSlider.dart';
import '../component/ovalButton.dart';
import '../component/bottomSheet/bottomSheet.dart';
import '../component/bottomSheet/bottomSheet1.dart';
import '../module/bluetooth/bluetoothPage.dart';
import 'individualMeditationCourse.dart';
import 'groupMeditationCoursePage.dart';

class zhuyeTab extends StatefulWidget {
  @override
  _zhuyeTabState createState() => _zhuyeTabState();
}

class _zhuyeTabState extends State<zhuyeTab> {
  // bool isConnected = false; // 模拟头环连接状态
  // bool isWorn = false; // 模拟头环佩戴状态
  bool isConnected = true; // 模拟头环连接状态
  bool isWorn = true; // 模拟头环佩戴状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/linao.png', width: 301/ 3.5, height: 77/3.5), // 可以设置图像的宽高
            const SizedBox(width: 8), // 适当调整图像和文本之间的间距
            const Text('正念冥想',
              style: TextStyle(
                color: Colors.black,
                fontSize: 46 / 3.5,
                letterSpacing: 10 / 3.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 606/3.5),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => lanyaPage()),
                );
              },
              child: Image.asset(
                'assets/lianjie.png',
                width: 134 / 3.5,
                height: 134 / 3.5,
              ),
            ),
          ],
        ),
      ),

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
                    LessonPage(),
                    LessonPage(),
                    LessonPage(),
                  ],
                ),
              ),
              Visibility(
                visible: !isConnected, // 当头环未连接时显示
                child: OvalButton(
                  onPressed: () {
                    // 执行头环未连接时的操作
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => lanyaPage()), // 将 BluetoothSettingsPage 替换为您的蓝牙设置页面
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '头环未连接，进入连接指引',
                        style: TextStyle(color: Colors.white),
                      ),
                      Image.asset(
                        'assets/touhuan.png',
                        width: 60,
                        height: 60,
                      ),
                    ],
                  ),
                  width: 350,
                  height: 50,
                  color: Colors.cyan,
                ),
              ),
              Visibility(
                visible: isConnected && !isWorn, // 当头环已连接但未佩戴时显示
                child: OvalButton(
                  onPressed: () {
                    // 执行头环未佩戴时的操作
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => lanyaPage()), // 将 BluetoothSettingsPage 替换为您的蓝牙设置页面
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '头环未佩戴，进入佩戴指引',
                        style: TextStyle(color: Colors.white),
                      ),
                      Image.asset(
                        'assets/touhuan.png',
                        width: 60,
                        height: 60,
                      ),
                    ],
                  ),
                  width: 350,
                  height: 50,
                  color: Colors.cyan,
                ),
              ),
              Visibility(
                visible: isConnected && isWorn, // 当头环已连接且已佩戴时隐藏按钮
                child: SizedBox.shrink(),
              ),
              SizedBox(height: 96/3.5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 8),
                  Container(
                    width: 15/3.5, // 竖线的宽度
                    height: 54/3.5, // 竖线的高度
                    color: Colors.black, // 竖线的颜色
                    margin: EdgeInsets.only(top: 8, bottom: 8, right: 8), // 控制竖线与文字的间距
                  ),
                  Text(
                    '为你推荐',
                    style: TextStyle(fontSize: 65/3.5, letterSpacing:6/3.5, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 2),
              Container(
                // width: 300,
                // height: 200,
                child:
                CustomButtonDrawer(
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
                    LessonPage(),
                    LessonPage(),
                    LessonPage(),
                  ],
                  containerHeight: 632/3.5, // 设置容器高度
                  containerWidth: 518/3.5, // 设置容器宽度
                  containerMargin: EdgeInsets.only(left: 54/3.5), // 设置容器边距
                ),
              ),
              SizedBox(height: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 8),
                  Container(
                    width: 15/3.5, // 竖线的宽度
                    height: 54/3.5, // 竖线的高度
                    color: Colors.black, // 竖线的颜色
                    margin: EdgeInsets.only(top: 8, bottom: 8, right: 8), // 控制竖线与文字的间距
                  ),
                  Text(
                    '多人冥想',
                    style: TextStyle(fontSize: 65/3.5, letterSpacing:6/3.5, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(width: 77/3.5),

                  OvalButton(
                    onPressed: () {
                      if (!isConnected) {
                        showCustomBottomSheet1(context);
                      } else if (isConnected && !isWorn) {
                        showCustomBottomSheet(context);
                      } else if (isConnected && isWorn) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => groupLessonPage()), // 替换为您的 GroupLsoonPage 页面
                        );
                      }
                    },
                    child: Text(
                      '创建房间',
                      style: TextStyle(color: Colors.white),
                    ),
                    width: 614 / 3.5,
                    height: 169 / 3.5,
                    color: Colors.cyan,
                  ),

                  SizedBox(width: 56/3.5), // 适当的间距

                  OvalButton(
                    onPressed: () {
                      showCustomBottomSheet(
                        context,
                      );
                      // 第二个按钮被点击时执行的操作
                    },
                    child: Text(
                      '加入房间',
                      style: TextStyle(color: Colors.white),
                    ),
                    width: 180,
                    height: 169/3.5,
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
}

