abstract class CoreRepository {
  Future<void> likeProduct({required productId});
  Future<void> dislikeProduct({required productId});
}
