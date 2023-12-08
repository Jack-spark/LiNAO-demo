import 'package:flutter/material.dart';

class CustomButtonDrawer1 extends StatefulWidget {
  final List<String> buttonLabels;
  final List<String> buttonImagePaths;
  final List<Widget> buttonDetailPages;

  const CustomButtonDrawer1({
    Key? key,
    required this.buttonLabels,
    required this.buttonImagePaths,
    required this.buttonDetailPages,
  }) : super(key: key);

  @override
  _CustomButtonDrawerState createState() => _CustomButtonDrawerState();
}

class _CustomButtonDrawerState extends State<CustomButtonDrawer1> {
  int _currentIndex = 0;
  bool _isDot = true; // 初始显示为 '.'

  @override
  Widget build(BuildContext context) {
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return Column(
      children: [
        SizedBox(height: 20), // 与手机边框的间隔
        GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity != 0) {
              setState(() {
                if (details.primaryVelocity! > 0 && _currentIndex > 0) {
                  _currentIndex--;
                } else if (details.primaryVelocity! < 0 &&
                    _currentIndex < widget.buttonLabels.length - 1) {
                  _currentIndex++;
                }
              });
            }
          },
          child: Container(
            height: 200,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black), // 与手机边框的颜色
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(widget.buttonImagePaths[_currentIndex]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 1), // 与手机边框的间隔
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.buttonLabels.length,
                (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                  _isDot = !_isDot;
                });
              },
              child: Text(
                 '.' ,
                style: TextStyle(
                  color: _currentIndex == index ? Colors.cyan : Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}