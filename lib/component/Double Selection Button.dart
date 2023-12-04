import 'package:flutter/material.dart';
// 蓝牙里面的双选按钮
class DualButtonSelector extends StatefulWidget {
  @override
  _DualButtonSelectorState createState() => _DualButtonSelectorState();
}

class _DualButtonSelectorState extends State<DualButtonSelector> {
  bool leftButtonSelected = false;
  bool rightButtonSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1290/3.5, // 设置容器的宽度
      height: 192/3.5, // 设置容器的高度
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20.0), // 椭圆形边框
        border: Border.all(color: Colors.grey), // 边框样式
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 设置按钮的对齐方式
        children: [
          SizedBox(
            width: 634/3.5, // 调整第一个按钮的宽度
            height: 173/3.5, // 调整第一个按钮的高度
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  leftButtonSelected = true;
                  rightButtonSelected = false;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: leftButtonSelected ? Colors.white : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // 自定义边框弧度
                ),
              ),
              child: Text(
                '连接指引',
                style: TextStyle(color: Colors.black), // 更改文本颜色为黑色
              ),
            ),
          ),
          // 调整两个按钮之间的间距
          SizedBox(
            width: 634/3.5, // 调整第二个按钮的宽度
            height: 173/3.5, // 调整第二个按钮的高度
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  rightButtonSelected = true;
                  leftButtonSelected = false;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: rightButtonSelected ? Colors.white : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // 自定义边框弧度
                ),
              ),
              child: Text(
              '佩戴指引',
              style: TextStyle(color: Colors.black), // 更改文本颜色为黑色
            ),
            ),
          ),
        ],
      ),
    );
  }
}
