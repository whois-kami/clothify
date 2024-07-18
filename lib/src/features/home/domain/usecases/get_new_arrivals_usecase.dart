import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/src/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetNewArrivalsUsecase {
  final HomeRepository homeRepository;
  GetNewArrivalsUsecase({
    required this.homeRepository,
  });

  Future<List<ProductEntity>> execute() async {
    return homeRepository.getNewArrivals();
  }
}
