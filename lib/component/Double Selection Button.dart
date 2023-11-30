import 'package:flutter/material.dart';

class DualButtonSelector extends StatefulWidget {
  @override
  _DualButtonSelectorState createState() => _DualButtonSelectorState();
}

class _DualButtonSelectorState extends State<DualButtonSelector> {
  bool leftButtonSelected = false;
  bool rightButtonSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              leftButtonSelected = true;
              rightButtonSelected = false;
            });
          },
          style: ElevatedButton.styleFrom(
            primary: leftButtonSelected ? Colors.blue : Colors.grey,
          ),
          child: Text('Left'),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            setState(() {
              rightButtonSelected = true;
              leftButtonSelected = false;
            });
          },
          style: ElevatedButton.styleFrom(
            primary: rightButtonSelected ? Colors.blue : Colors.grey,
          ),
          child: Text('Right'),
        ),
      ],
    );
  }
}