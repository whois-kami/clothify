// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/home/domain/entities/category_entity.dart';
import 'package:ecom_app/src/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUsecase {
  final HomeRepository homeRepository;
  GetAllCategoriesUsecase({
    required this.homeRepository,
  });

  Future<List<CategoryEntity>> execute() async {
    return homeRepository.getAllCategories();
  }
}
