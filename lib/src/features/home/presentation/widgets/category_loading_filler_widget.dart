import 'package:ecom_app/core/presentation/widgets/skeleton_widget.dart';
import 'package:flutter/material.dart';

class CategoryLoadingFillerWidget extends StatelessWidget {
  const CategoryLoadingFillerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: List.generate(6, (index) {
            return const Column(
              children: [
                SkeletonWidget(
                  height: 105.0,
                  width: double.infinity,
                ),
                SizedBox(height: 10),
              ],
            );
          }),
        ),
      ),
    );
  }
}
