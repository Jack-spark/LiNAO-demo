import 'package:flutter/material.dart';
import '../ovalButton.dart';
// 蓝牙里面的双选按钮
class DualButtonSelector6 extends StatefulWidget {
  @override
  _DualButtonSelectorState createState() => _DualButtonSelectorState();
}

class _DualButtonSelectorState extends State<DualButtonSelector6> {
  bool leftButtonSelected = true; // 默认选择左侧按钮
  bool rightButtonSelected = false;
  bool middleButtonSelected = false;

  @override
  void initState() {
    super.initState();
    // 设置默认状态为左侧按钮被选中
    leftButtonSelected = true;
    middleButtonSelected = false;
    rightButtonSelected = false;
    // 初始化左右两个页面为相应的界面
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 288 / 3.5,
              height: 111 / 3.5,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    leftButtonSelected = true;
                    middleButtonSelected = false;
                    rightButtonSelected = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: leftButtonSelected ? Colors.cyan : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  '快',
                  style: TextStyle(color: Colors.black, fontSize: 46 / 3.5),
                ),
              ),
            ),
            SizedBox(width: 35/3.5),
            SizedBox(
              width: 288 / 3.5,
              height: 111 / 3.5,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    rightButtonSelected = false;
                    middleButtonSelected = true;
                    leftButtonSelected = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: middleButtonSelected ? Colors.cyan : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  '中',
                  style: TextStyle(color: Colors.black, fontSize: 46/3.5),
                ),
              ),
            ),
            SizedBox(width: 35/3.5),
            SizedBox(
              width: 288 / 3.5,
              height: 111 / 3.5,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    rightButtonSelected = true;
                    middleButtonSelected = false;
                    leftButtonSelected = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: rightButtonSelected ? Colors.cyan : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  '慢',
                  style: TextStyle(color: Colors.black, fontSize: 46/3.5),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}