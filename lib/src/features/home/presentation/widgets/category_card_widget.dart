import 'package:ecom_app/src/features/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  final int index;
  final CategoryEntity categoryEntity;

  const CategoryCardWidget({
    super.key,
    required this.index,
    required this.categoryEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 105,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(categoryEntity.imageUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: index % 2 == 0
              ? const EdgeInsets.only(left: 20)
              : const EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: index % 2 == 0
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            children: [
              Text(categoryEntity.title),
              Text('${categoryEntity.productsId.length.toString()} products'),
            ],
          ),
        ),
      ),
    );
  }
}
