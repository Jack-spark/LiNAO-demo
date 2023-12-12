import 'package:flutter/material.dart';
import 'ovalButton.dart';
// 蓝牙里面的双选按钮
class DualButtonSelector1 extends StatefulWidget {
  @override
  _DualButtonSelectorState createState() => _DualButtonSelectorState();
}

class _DualButtonSelectorState extends State<DualButtonSelector1> {
  bool aButtonSelected = true; // 默认选择左侧按钮
  bool bButtonSelected = false;
  bool cButtonSelected = false;
  bool dButtonSelected = false;
  bool eButtonSelected = false;

  @override
  void initState() {
    super.initState();
    // 设置默认状态为左侧按钮被选中
    aButtonSelected = true;
    bButtonSelected = false;
    cButtonSelected = false;
    dButtonSelected = false;
    eButtonSelected = false;
    // 初始化左右两个页面为相应的界面
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 111 / 3.5,
              height: 111 / 3.5,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    aButtonSelected = true;
                    bButtonSelected = false;
                    cButtonSelected = false;
                    dButtonSelected = false;
                    eButtonSelected = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: aButtonSelected ? Colors.cyan : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.zero, // Set padding to zero
                ),
                child: Text(
                  '5',
                  style: TextStyle(color: Colors.black, fontSize: 46 / 3.5),
                ),
              ),
            ),
            SizedBox(width: 35/3.5),
            SizedBox(
              width: 111 / 3.5,
              height: 111 / 3.5,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    aButtonSelected = false;
                    bButtonSelected = true;
                    cButtonSelected = false;
                    dButtonSelected = false;
                    eButtonSelected = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: bButtonSelected ? Colors.cyan : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.zero, // Set padding to zero
                ),
                child: Text(
                  '10',
                  style: TextStyle(color: Colors.black, fontSize: 46/3.5),
                ),
              ),
            ),
            SizedBox(width: 35/3.5),
            SizedBox(
              width: 111 / 3.5,
              height: 111 / 3.5,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    aButtonSelected = false;
                    bButtonSelected = false;
                    cButtonSelected = true;
                    dButtonSelected = false;
                    eButtonSelected = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: cButtonSelected ? Colors.cyan : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.zero, // Set padding to zero
                ),
                child: Text(
                  '15',
                  style: TextStyle(color: Colors.black, fontSize: 46/3.5),
                ),
              ),
            ),
            SizedBox(width: 35/3.5),
            SizedBox(
              width: 111 / 3.5,
              height: 111 / 3.5,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    aButtonSelected = false;
                    bButtonSelected = false;
                    cButtonSelected = false;
                    dButtonSelected = true;
                    eButtonSelected = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: dButtonSelected ? Colors.cyan : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.zero, // Set padding to zero
                ),
                child: Text(
                  '20',
                  style: TextStyle(color: Colors.black, fontSize: 46/3.5),
                ),
              ),
            ),
            SizedBox(width: 35/3.5),
            SizedBox(
              width: 111 / 3.5,
              height: 111 / 3.5,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    aButtonSelected = false;
                    bButtonSelected = false;
                    cButtonSelected = false;
                    dButtonSelected = false;
                    eButtonSelected = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: eButtonSelected ? Colors.cyan : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.zero, // Set padding to zero
                ),
                child: Text(
                  '25',
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