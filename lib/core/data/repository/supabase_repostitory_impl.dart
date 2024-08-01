// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/core/data/data_source/supabase_source.dart';
import 'package:ecom_app/core/domain/entities/user_entity.dart';
import 'package:ecom_app/core/domain/repostitory/core_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CoreRepository)
class SupabaseCoreRepostitoryImpl implements CoreRepository {
  SupabaseCoreRepository supabaseCoreRepository;
  SupabaseCoreRepostitoryImpl({
    required this.supabaseCoreRepository,
  });
  @override
  Future<void> dislikeProduct({required String productId}) {
    return supabaseCoreRepository.dislikeProduct(productId: productId);
  }

  @override
  Future<void> likeProduct({required String productId}) {
    return supabaseCoreRepository.likeProduct(productId: productId);
  }

  @override
  Future<void> syncWithDb() async {
    supabaseCoreRepository.syncWithDatabase();
  }

  @override
  Future<UserEntity> getProfile() async {
    return await supabaseCoreRepository.getProfile();
  }

  Future<int> decrementCountProduct({required String productId}) async {
    return await supabaseCoreRepository.decrementCountProduct(
        productId: productId);
  }

  Future<int> incrementCountProduct({required String productId}) async {
    return await supabaseCoreRepository.incrementCountProduct(
        productId: productId);
  }

  Future<Map<String, dynamic>> getAllShopingCart() async {
    return await supabaseCoreRepository.getAllShopingCart();
  }

  @override
  Future<int?> getCountProduct({required String productId}) async {
    return await supabaseCoreRepository.getCountProduct(productId: productId);
  }
}
