// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/core/data/data_source/supabase_repository.dart';
import 'package:ecom_app/core/domain/repostitory/core_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CoreRepository)
class SupabaseCoreRepostitoryImpl implements CoreRepository {
  SupabaseCoreRepository supabaseCoreRepository;
  SupabaseCoreRepostitoryImpl({
    required this.supabaseCoreRepository,
  });
  @override
  Future<void> dislikeProduct({required productId}) {
    return supabaseCoreRepository.dislikeProduct(productId: productId);
  }

  @override
  Future<void> likeProduct({required productId}) {
    return supabaseCoreRepository.likeProduct(productId: productId);
  }
}
