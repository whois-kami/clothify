import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';

class ChangeInputFieldWidget extends StatefulWidget {
  final String titleContent;
  final TextEditingController controller;
  final String icon;
  final Color iconColor;
  final ValueChanged<bool> onChanged;
  final String? visibleEyeIcon;
  final String? noVisibleEyeIcon;

  const ChangeInputFieldWidget({
    super.key,
    required this.titleContent,
    required this.controller,
    required this.icon,
    required this.iconColor,
    required this.onChanged,
    this.visibleEyeIcon,
    this.noVisibleEyeIcon,
  });

  @override
  State<ChangeInputFieldWidget> createState() => _ChangeInputFieldWidgetState();
}

class _ChangeInputFieldWidgetState extends State<ChangeInputFieldWidget> {
  late String initialValue;
  bool isTextVisible = true;

  @override
  void initState() {
    super.initState();
    initialValue = widget.controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titleContent,
          // TODO текст стайл убрать
          style: const TextStyle(
            color: TColors.customBlue,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          obscureText: widget.visibleEyeIcon != null ? !isTextVisible : false,
          onChanged: (value) {
            if (value == initialValue) {
              widget.onChanged(false);
            } else {
              widget.onChanged(true);
            }
          },
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Transform.scale(
                scale: 0.9,
                child: Image.asset(
                  widget.icon,
                  width: 10,
                  height: 10,
                  fit: BoxFit.scaleDown,
                  color: widget.iconColor,
                ),
              ),
            ),
            suffixIcon: widget.visibleEyeIcon != null
                ? IconButton(
                    icon: Image.asset(
                      isTextVisible
                          ? widget.visibleEyeIcon!
                          : widget.noVisibleEyeIcon!,
                      width: isTextVisible ? 30 : 33,
                      height: isTextVisible ? 30 : 33,
                      fit: BoxFit.scaleDown,
                      color: TColors.colorGrey,
                    ),
                    onPressed: () {
                      setState(() {
                        isTextVisible = !isTextVisible;
                      });
                    },
                  )
                : null,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(17)),
              borderSide: BorderSide(
                color: TColors.subtleBlack.withOpacity(0.05),
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(17)),
              borderSide: BorderSide(
                color: TColors.subtleBlack.withOpacity(0.05),
                width: 1.5,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(17)),
              borderSide: BorderSide(
                color: TColors.customPurple,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
