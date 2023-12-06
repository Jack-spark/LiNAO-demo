import 'package:flutter/material.dart';
import 'package:platform_design/component/Double Selection Button.dart';


class lanyaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // 返回上一个界面
          },
        ),
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            DualButtonSelector(), // 这里调用你的双选按钮组件
            SizedBox(height: 96/3.5), // 设置间距
          ],
        ),
      ),
    );
  }
}