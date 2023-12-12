import 'package:flutter/material.dart';
import '../module/bluetooth/bluetoothPage.dart';
import 'ovalButton.dart';
// 底部弹出的浮窗
void showCustomBottomSheet1(BuildContext context) {
  // 在需要点击弹出底部浮窗的组件里，ontap事件里面调用showCustomBottomSheet方法
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
        child:  Column(
          children: [
            SizedBox(height:20),
            Text(
              '您的头环未连接，请连接后创建',
              style: TextStyle(fontSize: 61/3.5,letterSpacing: 2/3.5),
            ),
            SizedBox(height:20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // 设置边框颜色
                        width: 0.7, // 设置边框宽度
                      ),
                      borderRadius: BorderRadius.circular(25), // 设置圆角半径为按钮高度的一半
                    ),
                    child: OvalButton(
                      onPressed: () {
                        Navigator.pop(context); // 按钮被点击时的操作
                      },
                      child: Text(
                        '取消',
                        style: TextStyle(color: Colors.black),
                      ),
                      width: 595/3.5,
                      height: 184/3.5,
                      color: Colors.white,
                    ),
                  ),
                  OvalButton(
                    onPressed: () {

                    },
                    child: Text(
                      '去连接',
                      style: TextStyle(color: Colors.white),
                    ),
                    width: 595/3.5,
                    height: 184/3.5,
                    color: Colors.cyan,
                  ),
                ],
              ),
            ),
          ],
        ),// 传入的自定义内容
      );
    },
  );
}

