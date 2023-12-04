import 'package:flutter/material.dart';

class IndependentCheckboxWidget extends StatefulWidget {
  @override
  _IndependentCheckboxWidgetState createState() =>
      _IndependentCheckboxWidgetState();
}

class _IndependentCheckboxWidgetState extends State<IndependentCheckboxWidget> {
  bool isCheckboxChecked = false;

  @override
  Widget build(BuildContext context) {
    print("记住密码");
    return Checkbox(
      value: isCheckboxChecked,
      onChanged: (value) {
        isCheckboxChecked = !isCheckboxChecked;

        setState(() {
          isCheckboxChecked = value!;
        }
        );
      },
    );
  }
}