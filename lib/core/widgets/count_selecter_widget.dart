import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:flutter/material.dart';

class CountSelecterWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double? iconWidth;
  final double? iconHeight;

  const CountSelecterWidget({
     super.key,
    this.width = 98.0,
    this.height = 38.0,
    this.iconHeight = 25.0,
    this.iconWidth = 25.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              TAssetsPath.minusIcon,
              width: iconWidth,
              height: iconHeight,
            ),
          ),
          Text('3'),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              TAssetsPath.plusIcon,
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
    );
  }
}
