import 'package:flutter/material.dart';

void showCustomBottomSheet(BuildContext context, Widget content) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.25, // 底部弹窗高度为屏幕高度的四分之一
        decoration: BoxDecoration(
          color: Colors.white, // 弹窗背景色
          borderRadius: BorderRadius.only( // 设置顶部两个角为弧形
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child:  content, // 传入的自定义内容
      );
    },
  );
}

