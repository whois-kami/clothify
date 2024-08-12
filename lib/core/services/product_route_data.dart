// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/core/domain/entities/product_entity.dart';

 class ProductRouteData {
  final ProductEntity product;
  final String previousLocation;
  ProductRouteData({
    required this.product,
    required this.previousLocation,
  });
}
