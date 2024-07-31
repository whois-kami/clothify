import 'package:ecom_app/src/features/home/domain/entities/category_entity.dart';
import 'package:ecom_app/src/features/home/presentation/widgets/category_card_widget.dart';
import 'package:flutter/widgets.dart';

class CategoryFillerWidget extends StatelessWidget {
  final List<CategoryEntity> categories;
  const CategoryFillerWidget({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            final currentCategory = categories[index];
            return CategoryCardWidget(
              index: index,
              categoryEntity: currentCategory,
            );
          },
        ),
      ),
    );
  }
}

