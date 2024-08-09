import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  const ArticleWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 10),
        Text(subTitle, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
