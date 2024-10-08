// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/core/data/DTO/product_dto.dart';

class ProductEntity {
  final int id;
  final String title;
  final String manufacturer;
  final List<dynamic> tags;
  final String color;
  final int views;
  final String imageUrl;
  final int price;
  final bool isFavorite; 
  final DateTime releaseDate;
  final String location;
  final int availableQty;
  ProductEntity({
    required this.id,
    required this.title,
    required this.manufacturer,
    required this.tags,
    required this.color,
    required this.views,
    required this.imageUrl,
    required this.price,
    required this.isFavorite,
    required this.releaseDate,
    required this.location,
    required this.availableQty,

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
        isFavorite: dto.isFavorite ?? false,
        releaseDate: dto.releaseDate ?? DateTime(0, 0, 0, 0, 0, 0, 0),
        location: dto.location ?? '',
        availableQty: dto.availableQty ?? 0,

      );
}
