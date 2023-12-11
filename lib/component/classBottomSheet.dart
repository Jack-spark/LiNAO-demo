import 'package:flutter/material.dart';
import 'ovalButton.dart';
import 'lessonSegmentButton.dart';
// 底部弹出的浮窗
void showCustomBottomSheet(BuildContext context) {


  // 在需要点击弹出底部浮窗的组件里，ontap事件里面调用showCustomBottomSheet方法
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 1219/3.5,
        decoration: BoxDecoration(
          color: Colors.white, // 弹窗背景色
          borderRadius: BorderRadius.only( // 设置顶部两个角为弧形
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height:134/3.5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:96/3.5),
                  Text(
                    '头环状态',
                    style: TextStyle(fontSize: 46/3.5,letterSpacing: 2/3.5),
                  ),
                  SizedBox(width:35/3.5),
                  DualButtonSelector(),
                ],
              ),
            ),
            Text(
              '头环状态',
              style: TextStyle(fontSize: 46/3.5,letterSpacing: 2/3.5),
            ),
            SizedBox(height:20),
          ],
        ),
      );
    },
  );
}

