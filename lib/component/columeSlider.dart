import 'package:flutter/material.dart';

class CustomButtonGrid extends StatelessWidget {
  final List<String> buttonLabels;
  final List<String> buttonImagePaths;
  final List<Widget> buttonDetailPages;
  final double containerHeight;
  final double containerWidth;
  final EdgeInsetsGeometry containerMargin;
  final bool boole;

  const CustomButtonGrid({
    Key? key,
    required this.buttonLabels,
    required this.buttonImagePaths,
    required this.buttonDetailPages,
    this.boole = true,
    this.containerHeight = 737/3.5,
    this.containerWidth = 1286/3.5,
    this.containerMargin = const EdgeInsets.symmetric(vertical:  54/3.5),

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (boole == false) ? EdgeInsets.only(left: 365 / 3.5) : EdgeInsets.only(left: 0),
      width: containerWidth,
      child: Wrap(
        spacing: 58/3.5, // 横向间距
        runSpacing: 77/3.5, // 纵向间距
        children: List.generate(
          buttonLabels.length,
              (index) {
            final buttonText = buttonLabels[index];
            final buttonImagePath = buttonImagePaths[index];

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => buttonDetailPages[index],
                  ),
                );
              },
              child: _buildButtonContainer(context, buttonImagePath, buttonText),
            );
          },
        ),
      ),
    );
  }

  Widget _buildButtonContainer(BuildContext context, String imagePath, String label) {
    return Container(
      width: (containerWidth - 58/3.5) / 2, // 每列的宽度，减去间距后除以列数
      height: containerHeight, // 每行的高度
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}