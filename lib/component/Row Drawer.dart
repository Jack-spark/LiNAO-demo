import 'package:flutter/material.dart';

class CustomButtonDrawer extends StatelessWidget {
  final List<String> buttonLabels;
  final List<String> buttonImagePaths;
  final List<Widget> buttonDetailPages;
  final double containerHeight;
  final double containerWidth;
  final EdgeInsetsGeometry containerMargin;

  const CustomButtonDrawer({
    Key? key,
    required this.buttonLabels,
    required this.buttonImagePaths,
    required this.buttonDetailPages,
    this.containerHeight = 632/3.5,
    this.containerWidth = 518/3.5,
    this.containerMargin = const EdgeInsets.symmetric(vertical:  54/3.5),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      margin: EdgeInsets.symmetric(vertical: 16),

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: buttonLabels.length,
        itemBuilder: (context, index) {
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
    );
  }

  Widget _buildButtonContainer(
      BuildContext context, String imagePath, String label) {
    return Container(
      width: containerWidth,
      margin: containerMargin,
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
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  // child: Icon(
                  //   Icons.density_medium,
                  //   color: Colors.white,
                  // ),
                ),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Wrap(
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}