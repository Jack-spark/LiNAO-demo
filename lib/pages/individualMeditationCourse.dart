import 'package:flutter/material.dart';
import '../component/bottomSheet/courseBottomSheet.dart';

class LessonPage extends StatefulWidget {
  @override
  _LessonPageState createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  double _currentSliderValue = 0;
  bool _isFavorited = false;
  int _score = 0;
  bool _isPlaying = false;

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
            top: 2241/3.5, // 调整顶部位置
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
                SizedBox(height: 25/3.5),
                Text(
                  '冥想课程',
                  style: TextStyle(
                    fontSize: 42 / 3.5,
                    color: Colors.white,
                    letterSpacing: 4 / 3.5,
                  ),
                ),
                SizedBox(height: 100/3.5),
                Container(
                  width: 1248/3.5,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 8.0,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 10.0),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      thumbColor: Colors.white,
                      showValueIndicator: ShowValueIndicator.never,
                    ),
                    child: Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '0:00',
                      style: TextStyle(
                        fontSize: 42 / 3.5,
                        color: Colors.white,
                        letterSpacing: 4 / 3.5,
                      ),
                    ),
                    SizedBox(width: 1000/3.5),
                    Text(
                      '10:00',
                      style: TextStyle(
                        fontSize: 42 / 3.5,
                        color: Colors.white,
                        letterSpacing: 4 / 3.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 96/3.5),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        _isFavorited ? Icons.favorite : Icons.favorite_border,
                        size: 79 / 3.5,
                        color: _isFavorited ? Colors.white : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _isFavorited = !_isFavorited;
                        });
                      },
                    ),
                    SizedBox(width: 352.5/3.5), // 加一些间距
                    Container(
                      width: 230/3.5,
                      height: 230/3.5,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey, // 容器背景色
                        shape: BoxShape.circle, // 圆形形状
                      ),
                      child: Center(
                        child: Text(
                          _score.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 92/3.5,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 352.5/3.5),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPlaying = !_isPlaying;
                        });
                      },
                      child: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            size: 79/3.5,
                            color: Colors.white,
                          ),

                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



