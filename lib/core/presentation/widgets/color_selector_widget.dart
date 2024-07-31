import 'package:flutter/material.dart';

class ColorSelectorWidget extends StatelessWidget {
  final String currentColor;
  final Color circleColor;
  final String circleColorString;
  final double width;
  final double height;

  void Function()? onTap;
  ColorSelectorWidget({
    super.key,
    required this.onTap,
    required this.currentColor,
    required this.circleColorString,
    required this.circleColor, required this.width, required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentColor == circleColorString
                ? circleColor
                : circleColor.withOpacity(0.45),
          ),
          child: Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: onTap,
              customBorder: const CircleBorder(),
              child: Ink(
                height: height,
                width: width,
                child: AnimatedOpacity(
                  curve: Curves.bounceIn,
                  opacity: currentColor == circleColorString ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 40),
      ],
    );
  }
}
