import 'package:flutter/material.dart';

/*
TODO сделать парсинг карт из бд :)
*/
class CardWidget extends StatelessWidget {
  final Color borderColor;
  final Widget leadingIcon;
  const CardWidget({
    super.key,
    required this.borderColor,
    required this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Icon(Icons.abc),
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Master Card'),
                SizedBox(height: 5),
                Text('**** **** 1234'),
              ],
            ),
            Spacer(),
            leadingIcon,
          ],
        ),
      ),
    );
  }
}
