import 'package:ecom_app/core/domain/entities/user_entity.dart';

abstract class CoreRepository {
  Future<void> likeProduct({required String productId});
  Future<void> dislikeProduct({required String productId});
  Future<void> syncWithDb();
  Future<UserEntity> getProfile();
}
