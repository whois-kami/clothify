// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/home/data/DTO/product_dto.dart';

class ProductEntity {
  final int id;
  final String title;
  final String manufacturer;
  final List<dynamic> tags;
  final String color;
  final int views;
  final String imageUrl;
  final int price;

  ProductEntity({
    required this.id,
    required this.title,
    required this.manufacturer,
    required this.tags,
    required this.color,
    required this.views,
    required this.imageUrl,
    required this.price,
  });

  factory ProductEntity.fromDTO(ProductDto dto) => ProductEntity(
    id: dto.id ?? 0,
        title: dto.title ?? '',
        manufacturer: dto.manufacturer ?? '',
        tags: dto.tags ?? [],
        color: dto.color ?? '',
        views: dto.views ?? 0,
        imageUrl: dto.imageUrl ?? '',
        price: dto.price ?? 0,
      );
}
