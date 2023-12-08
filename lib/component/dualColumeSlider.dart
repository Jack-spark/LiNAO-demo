import 'package:flutter/material.dart';

class CustomButtonGrid extends StatelessWidget {
  final List<String> buttonLabels;
  final List<String> buttonImagePaths;
  final List<Widget> buttonDetailPages;

  const CustomButtonGrid({
    Key? key,
    required this.buttonLabels,
    required this.buttonImagePaths,
    required this.buttonDetailPages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 设置为两列
        crossAxisSpacing: 1/3.5, // 列间距
        mainAxisSpacing: 58/3.5, // 行间距
      ),
      itemCount: buttonLabels.length,
      itemBuilder: (context, index) {
        final buttonText = buttonLabels[index];
        final buttonImagePath = buttonImagePaths[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => buttonDetailPages[index],
              ),
            );
          },
          child: _buildButton(context, buttonImagePath, buttonText),
        );
      },
    );
  }

  Widget _buildButton(BuildContext context, String imagePath, String label) {
    return Container(
      width: 1000, // 按钮宽度
      height: 400, // 按钮高度
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.all(8),
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
