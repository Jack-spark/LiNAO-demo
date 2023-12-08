import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../widgets.dart';
import 'identifyingCode.dart';
import 'passwordInput.dart';
import 'independentCheckbox.dart';
import '../../component/ovalButton.dart';
import 'package:platform_design/component/bottomSheet.dart';

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
    print('设备像素密度：3.5');
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                width: 600 / 3.5,
                height: 77 / 3.5,
                margin: EdgeInsets.only(
                    top: 405 / 3.5, left: 115 / 3.5),
                child: Row(
                  children: [
                    Image.asset('assets/力脑logo.png',
                        width: 301 / 3.5,
                        height: 568 / 3.5),
                    SizedBox(width: 45 / 3.5),
                    Text(
                      '正念冥想',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 46 / 3.5,
                        letterSpacing: 10 / 3.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 131 / 3.5,
                height: 80 / 3.5,
                margin: EdgeInsets.only(
                    top: 720 / 3.5, left: 115 / 3.5),
                child: Text(
                  '账号',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 54 / 3.5,
                    letterSpacing: 11 / 3.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 870 / 3.5,
                left: 115 / 3.5,
                right: 115 / 3.5,
                child: PasswordInput('请输入账号'),
              ),
              Container(
                //width: 131 / 3.5,
                //height: 80 / 3.5,
                margin: EdgeInsets.only(
                    top: 1108 / 3.5, left: 115 / 3.5),
                child: Text(
                  '密码',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 54 / 3.5,
                    letterSpacing: 11 / 3.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 1258 / 3.5,
                left: 115 / 3.5,
                right: 115 / 3.5,
                child: PasswordInput('请输入密码'),
              ),
              Container(
                width: 196 / 3.5,
                height: 80 / 3.5,
                margin: EdgeInsets.only(
                    top: 1496 / 3.5, left: 115 / 3.5),
                child: Text(
                  '验证码',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 54 / 3.5,
                    letterSpacing: 11 / 3.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 1645 / 3.5,
                left: 115 / 3.5,
                right: 115 / 3.5,
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
                width: 250 / 3.5,
                height: 80 / 3.5,
                margin: EdgeInsets.only(
                    top: 1885 / 3.5,
                    left: 1075 / 3.5),
                child: Text(
                  '忘记密码？',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 46 / 3.5,
                    letterSpacing: 4 / 3.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 46 / 3.5,
                height: 46 / 3.5,
                margin: EdgeInsets.only(
                    top: 1900 / 3.5, left: 115 / 3.5),
                child: IndependentCheckboxWidget(),
              ),
              Container(
                width: 250 / 3.5,
                height: 80 / 3.5,
                margin: EdgeInsets.only(
                    top: 1885 / 3.5, left: 188 / 3.5),
                child: Text(
                  '记住密码',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 46 / 3.5,
                    letterSpacing: 4 / 3.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 2045 / 3.5,
                left: (MediaQuery.of(context).size.width - 1248 / 3.5) / 2,
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
                          fontSize: 65 / 3.5,
                        ),
                      ),
                    ],
                  ),
                  width: 1248 / 3.5,
                  height: 192 / 3.5,
                  color: Colors.cyan,
                ),
              ), // 登录按钮
              Positioned(
                top: 2331 / 3.5,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '——————',
                      style: TextStyle(
                        color: Color(0xFFB9B9B9),
                        fontSize: 65 / 3.5,
                      ),
                    ),
                    Text(
                      '没有账号，去',
                      style: TextStyle(
                        color: Color(0xFFADADAD),
                        fontSize: 65 / 3.5,
                      ),
                    ),
                    Text(
                      '注册',
                      style: TextStyle(
                        color: Color(0xFF12D0D0),
                        fontSize: 65 / 3.5,
                      ),
                    ),
                    Text(
                      '——————',
                      style: TextStyle(
                        color: Color(0xFFB9B9B9),
                        fontSize: 65 / 3.5,
                      ),
                    ),
                  ],
                ),
              ), // 没有账号，去注册
              Container(
                width: 46 / 3.5,
                height: 46 / 3.5,
                margin: EdgeInsets.only(
                    top: 1900 / 3.5, left: 115 / 3.5),
                child: IndependentCheckboxWidget(),
              ),
              Container(
                width: 46 / 3.5,
                height: 46 / 3.5,
                margin: EdgeInsets.only(
                    top: 2700 / 3.5, left: 115 / 3.5),
                child: IndependentCheckboxWidget(),
              ),
              Container(
                margin: EdgeInsets.only(top: 2700 / 3.5, left: 188 / 3.5),
                child: Row(
                  children: [
                    Text(
                      '我已阅读并同意LINAO正念冥想的',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 38 / 3.5,
                        letterSpacing: 2 / 3.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '《用户协议》',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 38 / 3.5,
                        letterSpacing: 2 / 3.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '和',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 38 / 3.5,
                        letterSpacing: 2 / 3.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '隐私政策',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 38 / 3.5,
                        letterSpacing: 2 / 3.5,
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