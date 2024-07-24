import 'package:ecom_app/core/presentation/widgets/skeleton_widget.dart';
import 'package:flutter/material.dart';

class FavoriteProductsLoadingWidget extends StatefulWidget {
  const FavoriteProductsLoadingWidget({super.key});

  @override
  State<FavoriteProductsLoadingWidget> createState() =>
      _FavoriteProductsLoadingWidget();
}

class _FavoriteProductsLoadingWidget
    extends State<FavoriteProductsLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.65,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Column(
              children: [
                SkeletonWidget(
                  width: 200,
                  height: 180,
                ),
                SizedBox(height: 10),
                SkeletonWidget(
                  height: 10,
                  width: 100,
                ),
                SizedBox(height: 10),
                SkeletonWidget(
                  height: 10,
                  width: 70,
                ),
                SizedBox(height: 10),
                SkeletonWidget(
                  height: 10,
                  width: 30,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
