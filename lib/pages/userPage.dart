import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../component/calendar.dart';
import '../component/ovalButton.dart';

import 'package:platform_design/module/scoreSwitch/scoreSwitch.dart';

class UserTab extends StatefulWidget {
  static const title = 'user';

  const UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  // static const title = 'user';
  int meditationDays = 0; //冥想天数，这是可以改变的量
  DateTime now = DateTime.now();
  int hour = DateTime.now().hour; //冥想时长，这是可以改变的量
  int minute = DateTime.now().minute; //冥想时长，这是可以改变的量
  int second = DateTime.now().second; //冥想时长，这是可以改变的量
  Widget _buildBody(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(children: [
            Positioned(
              top: 194 / 3.5,
              left: 77 / 3.5,
              child: Image.asset(
                'assets/形状结合.png',
                width: 77 / 3.5,
                height: 61 / 3.5,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 194 / 3.5,
                ),
                Center(
                  child: Container(
                    width: 346 / 3.5,
                    height: 346 / 3.5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/a1.png',
                        width: 346 / 3.5,
                        height: 346 / 3.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ), // 用户头像
                ),
                SizedBox(height: 58 / 3.5),
                Center(
                  child: Text(
                    'Jackspark',
                    style: TextStyle(
                      fontSize: 69 / 3.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                ), // 用户姓名
                SizedBox(height: 77 / 3.5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10), // 圆角半径
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1A000000), // 阴影颜色和透明度
                        spreadRadius: 2, // 阴影扩散半径
                        blurRadius: 5, // 阴影模糊半径
                        offset: Offset(0, 2), // 阴影偏移量
                      ),
                    ],
                  ),
                  width: 1286 / 3.5,
                  height: 258 / 3.5,
                  child: Row(
                    children: [
                      SizedBox(width: 77 / 3.5),
                      Text(
                        '冥想天数',
                        style: TextStyle(
                          fontSize: 42 / 3.5,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFADADAD),
                        ),
                      ),
                      SizedBox(width: 60 / 3.5),
                      Text(
                        '$meditationDays',
                        style: TextStyle(
                          fontSize: 77 / 3.5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF12D0D0),
                        ),
                      ),
                      SizedBox(width: 246 / 3.5),
                      Text(
                        '冥想时长',
                        style: TextStyle(
                          fontSize: 42 / 3.5,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFADADAD),
                        ),
                      ),
                      SizedBox(width: 63 / 3.5),
                      Text(
                        '$hour:$minute:$second',
                        style: TextStyle(
                          fontSize: 77 / 3.5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF12D0D0),
                        ),
                      ),
                    ],
                  ),
                ), // 冥想天数和冥想时长的框
                SizedBox(height: 96 / 3.5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10), // 圆角半径
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1A000000), // 阴影颜色和透明度
                        spreadRadius: 2, // 阴影扩散半径
                        blurRadius: 5, // 阴影模糊半径
                        offset: Offset(0, 2), // 阴影偏移量
                      ),
                    ],
                  ),
                  width: 1286 / 3.5,
                  height: 1344 / 3.5,
                  child: TableBasicsExample(), // 日历表
                ), //日历表
                SizedBox(height: 104 / 3.5),
                OvalButton(
                  width: 1286 / 3.5,
                  height: 194 / 3.5,
                  color: Color(0xFF3DE1B7),
                  child: Center(
                    child: Text(
                      '查看全部报告',
                      style: TextStyle(
                        fontSize: 61 / 3.5,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 115 / 3.5),
                Divider(
                  indent: 77 / 3.5,
                  endIndent: 77 / 3.5,
                  thickness: 2,
                  color: Color(0xFFDBDCDD),
                ),
                SizedBox(height: 115 / 3.5),
                scoreSwitch(
                  title: '练习时长及状态',
                  leftButtonText: '周',
                  middleButtonText: '月',
                  rightButtonText: '年',
                ),
                SizedBox(height: 115 / 3.5),
                Divider(
                  indent: 77 / 3.5,
                  endIndent: 77 / 3.5,
                  thickness: 2,
                  color: Color(0xFFDBDCDD),
                ),
                SizedBox(height: 115 / 3.5),
                scoreSwitch(
                  title: '近期冥想表现',
                  leftButtonText: '近7次',
                  middleButtonText: '近15次',
                  rightButtonText: '近30次',
                ),
                SizedBox(height: 115 / 3.5),
                // Expanded(
                //   child: Container(),
                // ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  @override
  Widget build(context) {
    return _buildAndroid(context);
  }
}