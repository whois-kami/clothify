import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';

class UserDataFieldWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  const UserDataFieldWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          // TODO убрать текст стайл
          style: const TextStyle(
            color: TColors.customBlue,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: TColors.whiteBg,
            borderRadius: BorderRadius.circular(17),
            border: Border.all(
              color: const Color(0xFFBCC1D0).withOpacity(0.2),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Image.asset(
                  icon,
                  width: 25,
                  height: 25,
                ),
                const SizedBox(width: 15),
                Text(subtitle),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
