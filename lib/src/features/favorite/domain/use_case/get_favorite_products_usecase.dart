// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/src/features/favorite/domain/repository/favorite_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFavoriteProductsUsecase {
  final FavoriteRepository homeRepository;
  GetFavoriteProductsUsecase({
    required this.homeRepository,
  });

  Future<List<ProductEntity>> execute() async {
    return homeRepository.getFavoritesProducts();
  }
}
