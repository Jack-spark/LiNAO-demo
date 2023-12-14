import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../component/slider/row_slider.dart';
import '../component/oval_button.dart';

class CourseTab extends StatelessWidget {
  static const title = 'course';
  static const androidIcon = Icon(Icons.person);
  static const iosIcon = Icon(CupertinoIcons.profile_circled);

  const CourseTab({super.key});

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      bottom: true,
      child:SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/冥想课程贴图.png',
              width: 1440 / 3.5,
            ),
            SizedBox(
              height: 81 / 3.5,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 77 / 3.5),
                Container(
                  height: 41,
                  width: 15 / 3.5, // 竖线的宽度
                  color: Colors.black, // 竖线的颜色
                  margin: EdgeInsets.only(right: 27 / 3.5), // 控制竖线与文字的间距
                ),
                SizedBox(width: 4 / 3.5),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '8周正念认知疗法',
                        style: TextStyle(
                            fontSize: 65 / 3.5,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333)),
                      ),
                      Text(
                        '由易到难，由浅入深，由短到长，由个体到人际，由具体到抽象，由静到动。',
                        style: TextStyle(
                            fontSize: 31 / 3.5,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF333333)),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF333333),
                  size: 50 / 3.5,
                ),
              ],
            ),
            SizedBox(
              height: 79 / 3.5,
            ),
            Stack(
              children: [
                Positioned(
                  left: 77 / 3.5,
                  // top: 1534 / 3.5,
                  width: 230 / 3.5,
                  height: 726 / 3.5,
                  child: OvalButton(
                    width: 230 / 3.5,
                    height: 726 / 3.5,
                    color: Colors.black,
                    Radius: 77 / 3.5,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: (192 - 38.5) / 3.5),
                        Text(
                          '三',
                          style: TextStyle(
                            fontSize: 77 / 3.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: (75 - 17.5) / 3.5),
                        Text(
                          '冥想理论',
                          style: TextStyle(
                            fontSize: 35 / 3.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: (141 - 35.5 / 2) / 3.5),
                        Container(
                          padding: EdgeInsets.all(80 / 3.5 / 2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black, // 背景颜色
                            border: Border.all(
                                color: Colors.white, width: 2.0), // 边框样式
                          ),
                          child: Icon(Icons.arrow_forward_ios_rounded,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
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
                  buttonDetailPages: [],
                  containerWidth: 576 / 3.5,
                  containerHeight: 723 / 3.5,
                  containerMargin: EdgeInsets.symmetric(horizontal: 29 / 3.5),
                  boole: false,
                )
              ],
            ),
            SizedBox(
              height: 94 / 3.5,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 77 / 3.5),
                Container(
                  height: 41,
                  width: 15 / 3.5, // 竖线的宽度
                  color: Colors.black, // 竖线的颜色
                  margin: EdgeInsets.only(right: 27 / 3.5), // 控制竖线与文字的间距
                ),
                SizedBox(width: 4 / 3.5),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '14天快速入门',
                        style: TextStyle(
                            fontSize: 65 / 3.5,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333)),
                      ),
                      Text(
                        '由易到难，由浅入深，由短到长，由个体到人际，由具体到抽象，由静到动。',
                        style: TextStyle(
                            fontSize: 31 / 3.5,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF333333)),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF333333),
                  size: 50 / 3.5,
                ),
              ],
            ),
            SizedBox(
              height: 79 / 3.5,
            ),
            Stack(
              children: [
                Positioned(
                  left: 77 / 3.5,
                  // top: 1534 / 3.5,
                  width: 230 / 3.5,
                  height: 726 / 3.5,
                  child: OvalButton(
                    width: 230 / 3.5,
                    height: 726 / 3.5,
                    color: Colors.black,
                    Radius: 77 / 3.5,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: (192 - 38.5) / 3.5),
                        Text(
                          '三',
                          style: TextStyle(
                            fontSize: 77 / 3.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: (75 - 17.5) / 3.5),
                        Text(
                          '冥想理论',
                          style: TextStyle(
                            fontSize: 35 / 3.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: (141 - 35.5 / 2) / 3.5),
                        Container(
                          padding: EdgeInsets.all(80 / 3.5 / 2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black, // 背景颜色
                            border: Border.all(
                                color: Colors.white, width: 2.0), // 边框样式
                          ),
                          child: Icon(Icons.arrow_forward_ios_rounded,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
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
                  buttonDetailPages: [],
                  containerWidth: 576 / 3.5,
                  containerHeight: 723 / 3.5,
                  containerMargin: EdgeInsets.symmetric(horizontal: 29 / 3.5),
                  boole: false,
                )
              ],
            ),
          ],
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
