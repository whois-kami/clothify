import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';

class LastSearchTag extends StatelessWidget {
  final String content;
  const LastSearchTag({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: TColors.greyBorder.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 5, left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  content,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.close),
                constraints: const BoxConstraints(
                  minWidth: 0,
                ),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
