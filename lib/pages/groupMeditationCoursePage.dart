///创建statefulWidget groupLessonPage
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../component/segmentButton/participateSegmentButton.dart';
import '../component/segmentButton/timeSegmentButton.dart';
import '../component/segmentButton/difficultySegmentButton.dart';
import '../component/slider/threeColumeSlider.dart';
import 'individualMeditationCourse.dart';
import '../component/segmentButton/feedbackSegmentButton.dart';
import '../component/segmentButton/frequencySegmentButton.dart';

class groupLessonPage extends StatefulWidget {
  @override
  _groupLessonPageState createState() => _groupLessonPageState();
}

class _groupLessonPageState extends State<groupLessonPage> {
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          children: [
            Container(
              width: 786 / 3.5, // 设置容器的宽度
              height: 192 / 3.5, // 设置容器的高度
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0), // 椭圆形边框
                border: Border.all(color: Colors.grey), // 边框样式
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 388 / 3.5,
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
                        primary: leftButtonSelected ? Colors.cyan : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        '自由冥想',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 388 / 3.5,
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
                        primary: rightButtonSelected ? Colors.cyan : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        '冥想课程',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          leftPage,
          rightPage,
        ],
      ),
    );
  }

  Widget _buildLeftPage() {
    return Visibility(
      visible: leftButtonSelected,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              color: Colors.black,
              thickness: 1, // 设置下划线粗细
            ),
            SizedBox(height: 10), // 调整下划线和文本的间距
            Row(
              children: [
                Text('参与冥想'),
                SizedBox(width: 16), // 适当的间距
                DualButtonSelector2()
              ],
            ),
            SizedBox(height: 10), // 调整下划线和文本的间距
            Row(
              children: [
                Text('练习难度'),
                SizedBox(width: 16), // 适当的间距
                DualButtonSelector1()
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: 1, // 设置下划线粗细
            ),
            Row(
              children: [
                Text('练习时长'),
                SizedBox(width: 16), // 适当的间距
                DualButtonSelector4()
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: 1, // 设置下划线粗细
            ),
            CustomButtonGrid(
              buttonLabels: [
                '',
                '',
                '',
                // Add more button labels as needed
              ],
              buttonImagePaths: [
                'assets/b1.png',
                'assets/b2.png',
                'assets/b2.png',
                // Add more image paths as needed
              ],
              buttonDetailPages: [
                LessonPage(),
                LessonPage(),
                LessonPage(),
              ],
            ),
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
          children: [
            Divider(
              color: Colors.black,
              thickness: 1, // 设置下划线粗细
            ),
            SizedBox(height: 10), // 调整下划线和文本的间距
            Row(
              children: [
                Text('反馈方式'),
                SizedBox(width: 16), // 适当的间距
                DualButtonSelector5()
              ],
            ),
            SizedBox(height: 10), // 调整下划线和文本的间距
            Row(
              children: [
                Text('练习难度'),
                SizedBox(width: 16), // 适当的间距
                DualButtonSelector1()
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: 1, // 设置下划线粗细
            ),
            Row(
              children: [
                Text('呼吸频率'),
                SizedBox(width: 16), // 适当的间距
                DualButtonSelector6()
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: 1, // 设置下划线粗细
            ),
            CustomButtonGrid(
              buttonLabels: [
                '',
                '',
                '',
                // Add more button labels as needed
              ],
              buttonImagePaths: [
                'assets/b1.png',
                'assets/b2.png',
                'assets/b2.png',
                // Add more image paths as needed
              ],
              buttonDetailPages: [
                LessonPage(),
                LessonPage(),
                LessonPage(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


