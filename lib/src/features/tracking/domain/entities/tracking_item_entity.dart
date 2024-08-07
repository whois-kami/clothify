// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/tracking/data/DTO/tracking_item_dto.dart';
import 'package:equatable/equatable.dart';

class TrackingItemEntity extends Equatable {
  final String title;
  final String color;
  final int qty;
  final String imgUrl;
  final String status;
  final int price;

  const TrackingItemEntity({
    required this.title,
    required this.color,
    required this.qty,
    required this.imgUrl,
    required this.status,
    required this.price
  });

  @override
  List<Object?> get props => [
        title,
        color,
        qty,
        imgUrl,
        status,
      ];

  factory TrackingItemEntity.fromDTO(TrackingItemDto dto) => TrackingItemEntity(
        title: dto.title ?? '',
        color: dto.color ?? '',
        qty: dto.qty ?? 0,
        imgUrl: dto.imgUrl ?? '',
        status: dto.status ?? '',
        price: dto.price ?? 0,
      );
}
