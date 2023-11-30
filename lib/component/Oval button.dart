import 'package:flutter/material.dart';

class OvalButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double width;
  final double height;
  final Color color;

  const OvalButton({
    Key? key,
    this.onPressed,
    required this.child,
    this.width = 120,
    this.height = 60,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}