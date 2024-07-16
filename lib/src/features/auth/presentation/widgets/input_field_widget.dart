import 'package:flutter/material.dart';

import '../../../../../core/constants/assets_path_constants.dart';

class CstInputFiled extends StatefulWidget {
  final String titleContent;
  final String textContent;
  final bool isPassword;
  final bool isPasswordVisible;
  final String pathToIcon;
  final void Function()? onPressed;
  final TextEditingController controller;

  const CstInputFiled({
    super.key,
    required this.titleContent,
    required this.isPassword,
    required this.isPasswordVisible,
    required this.textContent,
    required this.pathToIcon,
    required this.controller,
    this.onPressed,
  });

  @override
  State<CstInputFiled> createState() => _CstInputFiledState();
}

class _CstInputFiledState extends State<CstInputFiled> {
  bool isDone = false;
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titleContent,
          style: const TextStyle(
            color: Color(0xFF181D31),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Focus(
          onFocusChange: (hasFocus) {
            setState(() {
              isFocused = hasFocus;
            });
          },
          child: TextField(
            controller: widget.controller,
            obscureText: widget.isPassword && !widget.isPasswordVisible,
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                color: Color(0xFFBAC0CF),
                fontSize: 14,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Transform.scale(
                  scale: 0.9,
                  child: Image.asset(
                    widget.pathToIcon,
                    width: 10,
                    height: 10,
                    fit: BoxFit.scaleDown,
                    color: isFocused || isDone
                        ? const Color(0xFF5A56BB)
                        : const Color(0xFFBCC1D0),
                  ),
                ),
              ),
              filled: true,
              fillColor: const Color(0xFFFBFBFD),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(17)),
                borderSide: BorderSide(color: Color(0xFFFBFBFD)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(17)),
                borderSide: BorderSide(
                  color: Color(0xFFFBFBFD),
                  width: 1.5,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(17)),
                borderSide: BorderSide(
                  color: Color(0xFF5A56BB),
                  width: 1.5,
                ),
              ),
              hintText: widget.textContent,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: ImageIcon(
                          size: 25.0,
                          AssetImage(
                            widget.isPasswordVisible
                                ? TAssetsPath.visibleEyeIcon
                                : TAssetsPath.noVisibleEyeIcon,
                          )),
                      color: const Color(0xFFBCC1D0),
                      onPressed: widget.onPressed,
                    )
                  : null,
            ),
            onChanged: (value) {
              setState(() {
                isDone = value.isNotEmpty;
              });
            },
          ),
        ),
      ],
    );
  }
}
