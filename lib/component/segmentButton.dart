import 'package:flutter/material.dart';
import 'ovalButton.dart';
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
        leftPage,
        rightPage,
      ],
    );
  }

  Widget _buildLeftPage() {
    return Visibility(
      visible: leftButtonSelected,
      child: Container(
        padding: EdgeInsets.only(top: 96/3.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // 圆角半径
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // 阴影颜色和透明度
                    spreadRadius: 2, // 阴影扩散半径
                    blurRadius: 5, // 阴影模糊半径
                    offset: Offset(0, 2), // 阴影偏移量
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // 图片的圆角半径
                child: Image.asset(
                  'assets/lianjiejieshao.png', // 图片路径
                  width: 1286 / 3.5,
                  height: 649 / 3.5,
                  fit: BoxFit.cover, // 图片填充方式
                ),
              ),
            ),
            SizedBox(height: 96/3.5),
            Container(
              width: 1286 / 3.5,
              height: 1634 / 3.5,
              decoration: BoxDecoration(
                color: Colors.white, // 背景色
                borderRadius: BorderRadius.circular(10), // 圆角半径
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // 阴影颜色和透明度
                    spreadRadius: 2, // 阴影扩散半径
                    blurRadius: 5, // 阴影模糊半径
                    offset: Offset(0, 2), // 阴影偏移量
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 144 / 3.5, // 上边距
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), // 图片的圆角半径
                      child: Image.asset(
                        'assets/wuquanxian.png', // 图片路径
                        width: 699 / 3.5,
                        height: 702 / 3.5, // 图片填充方式
                        fit: BoxFit.contain, // 图片填充方式
                      ),
                    ),
                  ),
                  Positioned(
                    top: 943 / 3.5, // 上边距
                    left: 0,
                    right: 0,
                    child: Text.rich(
                      TextSpan(
                        text: '请开启',
                        children: <TextSpan>[
                          TextSpan(
                            text: '蓝牙',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '和'),
                          TextSpan(
                            text: '定位',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '功能'),
                        ],
                      ),
                      textAlign: TextAlign.center, // 文本水平居中
                      style: TextStyle(
                        fontSize: 50/3.5, // 字体大小
                        letterSpacing: 2/3.5, // 字间距
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1056 / 3.5, // 上边距
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '连接头环需要开启蓝牙功能和获取位置信息才能正常使用。',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 38/3.5,
                            letterSpacing: 2/3.5,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '开启后，请点击下方”我已开启按钮刷新界面“',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 38/3.5,
                            letterSpacing: 2/3.5,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 1290/ 3.5, // 上边距
                    left: 163/3.5,
                    right: 163/3.5,
                    child: OvalButton(
                      onPressed: () {

                      },
                      child: Text(
                        '去连接',
                        style: TextStyle(
                          fontSize: 61/3.5,
                          letterSpacing: 4/3.5,
                          color: Colors.white,
                        ),
                      ),
                      width: 960/3.5,
                      height: 180/3.5,
                      color: Colors.cyan,
                    ),
                  ),
                ],
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
            Container(
              width: 1286 / 3.5,
              height: 630 / 3.5,
              decoration: BoxDecoration(
                color: Colors.white, // 背景色
                borderRadius: BorderRadius.circular(10), // 圆角半径
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // 阴影颜色和透明度
                    spreadRadius: 2, // 阴影扩散半径
                    blurRadius: 5, // 阴影模糊半径
                    offset: Offset(0, 2), // 阴影偏移量
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 121 / 3.5, // 上边距
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), // 图片的圆角半径
                      child: Image.asset(
                        'assets/weitu.png', // 图片路径
                        width: 927 / 3.5,
                        height: 509 / 3.5, // 图片填充方式
                        fit: BoxFit.contain, // 图片填充方式
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 106/3.5),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // 圆角半径
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // 阴影颜色和透明度
                    spreadRadius: 2, // 阴影扩散半径
                    blurRadius: 5, // 阴影模糊半径
                    offset: Offset(0, 2), // 阴影偏移量
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // 图片的圆角半径
                child: Image.asset(
                  'assets/touhuanpeidaijieshao.png', // 图片路径
                  width: 1286 / 3.5,
                  height: 987 / 3.5,
                  fit: BoxFit.cover, // 图片填充方式
                ),
              ),
            ),
            // 可以在这里添加其他的文本或小部件
          ],
        ),
      ),
    );
  }
}