import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../component/Row Drawer.dart';

class CourseTab extends StatelessWidget {
  static const title = 'course';
  static const androidIcon = Icon(Icons.person);
  static const iosIcon = Icon(CupertinoIcons.profile_circled);

  const CourseTab({super.key});

  Widget _buildBody(BuildContext context) {
    return Column(
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

          ],
        ),

      ],
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
