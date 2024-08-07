import 'package:flutter/material.dart';

class ElvButtonWidget extends StatelessWidget {
  final String textContent;
  final void Function() onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Widget? leadingIcon;
  final BorderSide? side;
  final Size? minSize;
  const ElvButtonWidget({
    super.key,
    required this.textContent,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF514DB5),
    this.foregroundColor = Colors.white,
    this.leadingIcon,
    this.side,
    this.minSize = const Size(350, 55),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: leadingIcon ?? const SizedBox.shrink(),
      label: Text(textContent),
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: minSize,
        elevation: 0,
        side: side,
        
      ),
    );
  }
}
