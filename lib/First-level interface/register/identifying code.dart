import 'package:flutter/material.dart';
import 'dart:math';

class CustomVertificationCode extends StatefulWidget {
  final int dotCount;
  final double width;
  final double height;
  final Color backgroundColor;

  const CustomVertificationCode(
      {Key? key,
      this.backgroundColor = Colors.white,
      this.dotCount = 50,
      this.width = 120,
      this.height = 40})
      : super(key: key);

  @override
  _CustomVertificationCodeState createState() =>
      _CustomVertificationCodeState();
}

class _CustomVertificationCodeState extends State<CustomVertificationCode> {
  String code = 'da65';

  _getCode() {
    code = '';
    String alphabet = 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
    for (var i = 0; i < 4; i++) {
      String charOrNum = Random().nextInt(2) % 2 == 0 ? "char" : "num";
      switch (charOrNum) {
        case "char":
          code += alphabet[Random().nextInt(alphabet.length)];
          break;
        case "num":
          code += Random().nextInt(9).toString();
          break;
      }
    }
  }

  //随机生成绘图数据
  Map getFixedData() {
    List list = code.split("");
    double x = 0.0;
    double maxFontSize = 35.0;
    List mList = [];

    for (String item in list) {
      // 固定的颜色和字体样式
      Color color = Color.fromARGB(255, 0, 0, 0); // 这里可以设置固定颜色
      int fontWeight = FontWeight.normal.index;  // 固定字体样式
      TextSpan span = TextSpan(
          text: item,
          style: TextStyle(
              color: color,
              fontWeight: FontWeight.values[fontWeight],
              fontSize: maxFontSize));
      TextPainter painter = TextPainter(text: span, textDirection: TextDirection.ltr);
      painter.layout();

      // 固定 Y 坐标
      double y = 0.0;

      Map strMap = {"painter": painter, "x": x, "y": y};
      mList.add(strMap);
      x += painter.width + 3; // 固定间距
    }

    double offsetX = (widget.width - x) / 2;

    Map fixedCodeDrawData = {
      "painterData": mList,
      "offsetX": offsetX,
      // 没有干扰点，可以根据需要添加
      "dotData": [],
    };

    return fixedCodeDrawData;
  }


  @override
  Widget build(BuildContext context) {
    print("buid?");
    double maxWidth = 0.0;
    Map drawData = getFixedData();
    //计算最大宽度做自适应
    maxWidth = getTextSize("8" * code.length,
            TextStyle(fontWeight: FontWeight.values[8], fontSize: 25))
        .width;
    return InkWell(
        child: Container(
            color: widget.backgroundColor,
            width: maxWidth > widget.width ? maxWidth : widget.width,
            height: widget.height,
            child: CustomPaint(
              painter: CustomVertificationCodePainter(drawData: drawData),
            )),
        onTap: () {
          setState(() {
            _getCode();
            drawData = getFixedData();
          });
        });
  }

  Size getTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}

class CustomVertificationCodePainter extends CustomPainter {
  final Map drawData;

  CustomVertificationCodePainter({
    required this.drawData,
  });

  Paint _paint = new Paint()
    ..color = Colors.grey
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..strokeWidth = 1.0
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    List mList = drawData["painterData"];

    double offsetX = drawData["offsetX"];
    //为了能��居中显示移动画布
    canvas.translate(offsetX, 0);
    //从Map中取出值，直接绘制
    for (var item in mList) {
      TextPainter painter = item["painter"];
      double x = item["x"];
      double y = item["y"];
      painter.paint(
        canvas,
        Offset(x, y),
      );
    }
    // //将画布平移回去

    canvas.translate(-offsetX, 0);
    List dotData = drawData["dotData"];
    for (var item in dotData) {
      double x = item["x"];
      double y = item["y"];
      double dotWidth = item["dotWidth"];
      Color color = item["color"];
      _paint.color = color;
      canvas.drawOval(Rect.fromLTWH(x, y, dotWidth, dotWidth), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
