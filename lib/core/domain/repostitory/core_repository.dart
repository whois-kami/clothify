import 'package:ecom_app/core/domain/entities/user_entity.dart';

abstract class CoreRepository {
  Future<void> likeProduct({required String productId});
  Future<void> dislikeProduct({required String productId});
  Future<void> syncWithDb();
  Future<UserEntity> getProfile();
  Future<int> decrementCountProduct({required String productId});
  Future<int> incrementCountProduct({required String productId});
  Future<int?> getCountProduct({required String productId});
  Future<Map<String, dynamic>> getAllShopingCart();
}
