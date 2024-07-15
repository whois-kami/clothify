// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/home/data/DTO/category_dto.dart';

class CategoryEntity {
  final String title;
  final List<int> productsId;
  final String imageUrl;

  CategoryEntity({
    required this.title,
    required this.productsId,
    required this.imageUrl,
  });

  factory CategoryEntity.fromDTO(CategoryDTO dto) => CategoryEntity(
        title: dto.title ?? '',
        productsId:
            dto.productsId!.split(',').map((id) => int.parse(id)).toList(),
        imageUrl: dto.imageUrl ?? '',
      );

  CategoryEntity copyWith({
    String? title,
    String? productsId,
    String? imageUrl,
  }) {
    return CategoryEntity(
      title: title ?? this.title,
      productsId: productsId!.split(',').map((id) => int.parse(id)).toList() ??
          this.productsId,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
