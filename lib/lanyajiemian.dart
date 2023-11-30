import 'package:flutter/material.dart';


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
        child: Text(
          '这是一个Flutter界面，点击左上角的退出键返回上一个界面',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}