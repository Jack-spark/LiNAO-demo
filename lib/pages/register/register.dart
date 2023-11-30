import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../utils.dart';
import '../../widgets.dart';
import 'identifying code.dart';
import 'PasswordInput.dart';
import 'IndependentCheckbox.dart';
import '../../component/Oval button.dart';

class register extends StatefulWidget {
  static const title = 'register';

  const register({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  String code = '';

  Widget _buildAndroid(BuildContext context) {
    //设备像素密度
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    print('设备像素密度：$devicePixelRatio');
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                width: 600 / devicePixelRatio,
                height: 77 / devicePixelRatio,
                margin: EdgeInsets.only(
                    top: 405 / devicePixelRatio, left: 115 / devicePixelRatio),
                child: Row(
                  children: [
                    Image.asset('assets/力脑logo.png',
                        width: 301 / devicePixelRatio,
                        height: 568 / devicePixelRatio),
                    SizedBox(width: 45 / devicePixelRatio),
                    Text(
                      '正念冥想',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 46 / devicePixelRatio,
                        letterSpacing: 10 / devicePixelRatio,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 131 / devicePixelRatio,
                height: 80 / devicePixelRatio,
                margin: EdgeInsets.only(
                    top: 720 / devicePixelRatio, left: 115 / devicePixelRatio),
                child: Text(
                  '账号',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 54 / devicePixelRatio,
                    letterSpacing: 11 / devicePixelRatio,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 870 / devicePixelRatio,
                left: 115 / devicePixelRatio,
                right: 115 / devicePixelRatio,
                child: PasswordInput('请输入账号'),
              ),
              Container(
                //width: 131 / devicePixelRatio,
                //height: 80 / devicePixelRatio,
                margin: EdgeInsets.only(
                    top: 1108 / devicePixelRatio, left: 115 / devicePixelRatio),
                child: Text(
                  '密码',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 54 / devicePixelRatio,
                    letterSpacing: 11 / devicePixelRatio,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 1258 / devicePixelRatio,
                left: 115 / devicePixelRatio,
                right: 115 / devicePixelRatio,
                child: PasswordInput('请输入密码'),
              ),
              Container(
                width: 196 / devicePixelRatio,
                height: 80 / devicePixelRatio,
                margin: EdgeInsets.only(
                    top: 1496 / devicePixelRatio, left: 115 / devicePixelRatio),
                child: Text(
                  '验证码',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 54 / devicePixelRatio,
                    letterSpacing: 11 / devicePixelRatio,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 1645 / devicePixelRatio,
                left: 115 / devicePixelRatio,
                right: 115 / devicePixelRatio,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: PasswordInput('请输入验证码'),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomVertificationCode(),
                    )
                  ],
                ),
              ),
              Container(
                width: 250 / devicePixelRatio,
                height: 80 / devicePixelRatio,
                margin: EdgeInsets.only(
                    top: 1885 / devicePixelRatio,
                    left: 1075 / devicePixelRatio),
                child: Text(
                  '忘记密码？',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 46 / devicePixelRatio,
                    letterSpacing: 4 / devicePixelRatio,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 46 / devicePixelRatio,
                height: 46 / devicePixelRatio,
                margin: EdgeInsets.only(
                    top: 1900 / devicePixelRatio, left: 115 / devicePixelRatio),
                child: IndependentCheckboxWidget(),
              ),
              Container(
                width: 250 / devicePixelRatio,
                height: 80 / devicePixelRatio,
                margin: EdgeInsets.only(
                    top: 1885 / devicePixelRatio, left: 188 / devicePixelRatio),
                child: Text(
                  '记住密码',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 46 / devicePixelRatio,
                    letterSpacing: 4 / devicePixelRatio,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 2045 / devicePixelRatio,
                left: (MediaQuery.of(context).size.width - 1248 / devicePixelRatio) / 2,
                child: OvalButton(
                  onPressed: () {
                    // 第一个按钮被点击时执行的操作
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '登录',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 65 / devicePixelRatio,
                        ),
                      ),
                    ],
                  ),
                  width: 1248 / devicePixelRatio,
                  height: 192 / devicePixelRatio,
                  color: Colors.cyan,
                ),
              ), // 登录按钮
              Positioned(
                top: 2331 / devicePixelRatio,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '——————',
                      style: TextStyle(
                        color: Color(0xFFB9B9B9),
                        fontSize: 65 / devicePixelRatio,
                      ),
                    ),
                    Text(
                      '没有账号，去',
                      style: TextStyle(
                        color: Color(0xFFADADAD),
                        fontSize: 65 / devicePixelRatio,
                      ),
                    ),
                    Text(
                      '注册',
                      style: TextStyle(
                        color: Color(0xFF12D0D0),
                        fontSize: 65 / devicePixelRatio,
                      ),
                    ),
                    Text(
                      '——————',
                      style: TextStyle(
                        color: Color(0xFFB9B9B9),
                        fontSize: 65 / devicePixelRatio,
                      ),
                    ),
                  ],
                ),
              ), // 没有账号，去注册
              Container(
                width: 46 / devicePixelRatio,
                height: 46 / devicePixelRatio,
                margin: EdgeInsets.only(
                    top: 1900 / devicePixelRatio, left: 115 / devicePixelRatio),
                child: IndependentCheckboxWidget(),
              ),
              Container(
                width: 46 / devicePixelRatio,
                height: 46 / devicePixelRatio,
                margin: EdgeInsets.only(
                    top: 2700 / devicePixelRatio, left: 115 / devicePixelRatio),
                child: IndependentCheckboxWidget(),
              ),
              Container(
                margin: EdgeInsets.only(top: 2700 / devicePixelRatio, left: 188 / devicePixelRatio),
                child: Row(
                  children: [
                    Text(
                      '我已阅读并同意LINAO正念冥想的',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 38 / devicePixelRatio,
                        letterSpacing: 2 / devicePixelRatio,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '《用户协议》',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 38 / devicePixelRatio,
                        letterSpacing: 2 / devicePixelRatio,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '和',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 38 / devicePixelRatio,
                        letterSpacing: 2 / devicePixelRatio,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '隐私政策',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 38 / devicePixelRatio,
                        letterSpacing: 2 / devicePixelRatio,
                        fontWeight: FontWeight.bold,
                      ),
                    ), // 我已阅读并同意LINAO正念冥想的
                  ],
                ),
              ), // 已阅读前面的框
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildAndroid,
    );
  }
}