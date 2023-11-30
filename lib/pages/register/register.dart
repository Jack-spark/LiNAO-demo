import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../utils.dart';
import '../../widgets.dart';
import 'identifying code.dart';
import 'PasswordInput.dart';
import 'IndependentCheckbox.dart';

class register extends StatefulWidget {
  static const title = 'register';

  const register({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final List<String> buttonLabels = ['', ''];
  List<String> buttonImagePaths = [
    'assets/a1.png',
    'assets/a2.png',
    // 添加更多按钮的图标数据
  ];
  List<Widget> ButtonDetailPage = [];
  static const _itemsLength = 50;
  late List<MaterialColor> colors;
  late List<String> songNames;
  String code = '';

  @override
  void initState() {
    _setData();
    super.initState();
  }

  void _setData() {
    colors = getRandomColors(_itemsLength);
    songNames = getRandomNames(_itemsLength);
  }

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
