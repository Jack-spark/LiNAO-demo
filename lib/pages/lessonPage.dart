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
      appBar: AppBar(
        title: Text('Lesson Page'),
      ),
      body: Center(
        child: Text('Lesson Page Content'),
      ),
    );
  }
}



