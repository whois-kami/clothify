abstract class CoreRepository {
  Future<void> likeProduct({required String productId});
  Future<void> dislikeProduct({required String productId});
  Future<void> syncWithDb();
}
