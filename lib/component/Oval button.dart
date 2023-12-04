import 'package:flutter/material.dart';

class OvalButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double width;
  final double height;
  final Color color;
  final double ? Radius;
  const OvalButton({
    Key? key,
    this.onPressed,
    required this.child,
    this.width = 120,
    this.height = 60,
    this.color = Colors.blue,
    this.Radius = 60 / 2,
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
          borderRadius: BorderRadius.circular(Radius!),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}