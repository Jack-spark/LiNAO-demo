import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String hintText;

  const PasswordInput(this.hintText, {Key? key}) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true; // 是否隐藏输入内容

  @override
  Widget build(BuildContext context) {
    return buildTextField();
  }

  Widget buildTextField() {
    if (widget.hintText == '请输入密码') {
      return TextField(
        controller: _passwordController,
        obscureText: _obscureText, // 将文本内容隐藏为密码形式
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Color(0xFFD8D8D8),
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD8D8D8)), // 底部边框颜色
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD8D8D8)), // 底部边框颜色
          ),
        ),
      );
    } else {
      return TextField(
        controller: _passwordController,
        decoration: InputDecoration(
          hintText: widget.hintText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD8D8D8)), // 底部边框颜色
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD8D8D8)), // 底部边框颜色
          ),
        ),
      );
    }
  }
}
