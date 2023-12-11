import 'package:flutter/material.dart';
import 'package:platform_design/component/calendar.dart';
import 'package:platform_design/component/ovalButton.dart';
import 'package:get/get.dart';
import 'package:platform_design/module/scoreSwitch/lineChart.dart';

class scoreSwitch extends StatefulWidget {
  final double width;
  final double? height;
  final String title;
  String leftButtonText;
  String middleButtonText;
  String rightButtonText;

  scoreSwitch({
    Key? key,
    this.width = 1286 / 3.5,
    this.height = 1185 / 3.5,
    required this.title,
    required this.leftButtonText,
    required this.middleButtonText,
    required this.rightButtonText,
  }) : super(key: key);

  @override
  _scoreSwitchState createState() => _scoreSwitchState();
}

class _scoreSwitchState extends State<scoreSwitch> {
  Color color = Color(0xFFFFFFFF);
  Color textColor = Color(0xFF666666);
  bool leftButtonSelected = true;
  bool middleButtonSelected = false;
  bool rightButtonSelected = false;
  late Widget leftPage;
  late Widget middlePage;
  late Widget rightPage;

  @override
  void initState() {
    super.initState();
    leftButtonSelected = true;
    middleButtonSelected = false;
    rightButtonSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(
          left: 77 / 3.5,
          right: 77 / 3.5,
        ),
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
        width: widget.width,
        height: widget.height,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 134 / 3.5),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 58 / 3.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: 273 / 3.5),
              LineChartWidget(),
            ],
          ),
        ), // 日历表
      ),
      SizedBox(height: 132 / 3.5),
      Container(
        margin: EdgeInsets.only(
          left: 77 / 3.5,
          right: 77 / 3.5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OvalButton(
              width: 384 / 3.5,
              height: 154 / 3.5,
              color: leftButtonSelected ? Color(0xFF3DE1B7) : color,
              boxShadow: [
                BoxShadow(
                  color: Color(0x1A000000), // 阴影颜色和透明度
                  spreadRadius: 2, // 阴影扩散半径
                  blurRadius: 5, // 阴影模糊半径
                  offset: Offset(0, 2), // 阴影偏移量
                ),
              ],
              child: Text(
                widget.leftButtonText,
                style: TextStyle(
                  fontSize: 54 / 3.5,
                  fontWeight: FontWeight.w600,
                  color: leftButtonSelected ? Colors.white : textColor,
                ),
              ),
              onPressed: () {
                setState(() {
                  leftButtonSelected = true;
                  middleButtonSelected = false;
                  rightButtonSelected = false;
                });
              },
            ),
            OvalButton(
              width: 384 / 3.5,
              height: 154 / 3.5,
              color: middleButtonSelected ? Color(0xFF3DE1B7) : color,
              boxShadow: [
                BoxShadow(
                  color: Color(0x1A000000), // 阴影颜色和透明度
                  spreadRadius: 2, // 阴影扩散半径
                  blurRadius: 5, // 阴影模糊半径
                  offset: Offset(0, 2), // 阴影偏移量
                ),
              ],
              child: Text(
                widget.middleButtonText,
                style: TextStyle(
                  fontSize: 54 / 3.5,
                  fontWeight: FontWeight.w600,
                  color: middleButtonSelected ? Colors.white : textColor,
                ),
              ),
              onPressed: () {
                setState(() {
                  leftButtonSelected = false;
                  middleButtonSelected = true;
                  rightButtonSelected = false;
                });
              },
            ),
            OvalButton(
              width: 384 / 3.5,
              height: 154 / 3.5,
              color: rightButtonSelected ? Color(0xFF3DE1B7) : color,
              boxShadow: [
                BoxShadow(
                  color: Color(0x1A000000), // 阴影颜色和透明度
                  spreadRadius: 2, // 阴影扩散半径
                  blurRadius: 5, // 阴影模糊半径
                  offset: Offset(0, 2), // 阴影偏移量
                ),
              ],
              child: Text(
                widget.rightButtonText,
                style: TextStyle(
                  fontSize: 54 / 3.5,
                  fontWeight: FontWeight.w600,
                  color: rightButtonSelected ? Colors.white : textColor,
                ),
              ),
              onPressed: () {
                setState(() {
                  leftButtonSelected = false;
                  middleButtonSelected = false;
                  rightButtonSelected = true;
                });
              },
            ),
          ],
        ),
      ),
    ]);
  }
}