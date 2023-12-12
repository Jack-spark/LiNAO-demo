import 'package:flutter/material.dart';
import '../component/classBottomSheet.dart';

class LessonPage extends StatefulWidget {
  @override
  _LessonPageState createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showCustomBottomSheet(
        context,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 1440 / 3.5,
            height: 3118 / 3.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/hailangyi.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 196/3.5, // 调整顶部位置
            left: 48/3.5, // 调整左侧位置
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: 96 / 3.5,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned(
            top: 2296/3.5, // 调整顶部位置
            left: 96/3.5, // 调整左侧位置
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '海浪冥想（一）',
                  style: TextStyle(
                    fontSize: 84 / 3.5,
                    color: Colors.white,
                    letterSpacing: 6 / 3.5,
                  ),
                ),
                Text(
                  '冥想课程',
                  style: TextStyle(
                    fontSize: 42 / 3.5,
                    color: Colors.white,
                    letterSpacing: 4 / 3.5,
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}



