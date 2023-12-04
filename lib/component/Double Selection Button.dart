import 'package:flutter/material.dart';
// 蓝牙里面的双选按钮
class DualButtonSelector extends StatefulWidget {
  @override
  _DualButtonSelectorState createState() => _DualButtonSelectorState();
}

class _DualButtonSelectorState extends State<DualButtonSelector> {
  bool leftButtonSelected = true; // 默认选择左侧按钮
  bool rightButtonSelected = false;

  late Widget leftPage; // 左侧按钮对应的界面
  late Widget rightPage; // 右侧按钮对应的界面

  @override
  void initState() {
    super.initState();
    // 设置默认状态为左侧按钮被选中
    leftButtonSelected = true;
    rightButtonSelected = false;
    // 初始化左右两个页面为相应的界面
    leftPage = _buildLeftPage();
    rightPage = _buildRightPage();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 1290 / 3.5, // 设置容器的宽度
          height: 192 / 3.5, // 设置容器的高度
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20.0), // 椭圆形边框
            border: Border.all(color: Colors.grey), // 边框样式
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 634 / 3.5,
                height: 173 / 3.5,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      leftButtonSelected = true;
                      rightButtonSelected = false;
                      leftPage = _buildLeftPage(); // 更新左侧界面
                      rightPage = _buildRightPage(); // 更新右侧界面
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: leftButtonSelected ? Colors.white : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    '连接指引',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                width: 634 / 3.5,
                height: 173 / 3.5,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      rightButtonSelected = true;
                      leftButtonSelected = false;
                      leftPage = _buildLeftPage(); // 更新左侧界面
                      rightPage = _buildRightPage(); // 更新右侧界面
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: rightButtonSelected ? Colors.white : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    '佩戴指引',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        leftPage,
        SizedBox(height: 20),
        rightPage,
      ],
    );
  }

  Widget _buildLeftPage() {
    return Visibility(
      visible: leftButtonSelected,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/lianjiejieshao.png', // 图片路径
              // width: 150, // 设置图片宽度
              // height: 150, // 设置图片高度
              fit: BoxFit.cover, // 图片填充方式
            ),
            SizedBox(height: 16),
            Text(
              'Your text here', // 可选的文本内容
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            // 可以在这里添加其他的文本或小部件
          ],
        ),
      ),
    );
  }

  Widget _buildRightPage() {
    return Visibility(
      visible: rightButtonSelected,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/b2.png', // 图片路径
              width: 150, // 设置图片宽度
              height: 150, // 设置图片高度
              fit: BoxFit.cover, // 图片填充方式
            ),
            SizedBox(height: 16),
            Text(
              'Your text here', // 可选的文本内容
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            // 可以在这里添加其他的文本或小部件
          ],
        ),
      ),
    );
  }
}