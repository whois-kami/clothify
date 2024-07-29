// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddLastSearchUsecase {
  final HomeRepository homeRepository;
  AddLastSearchUsecase({
    required this.homeRepository,
  });

  Future<void> execute({required String query}) async {
    return homeRepository.addLastSearch(query: query);
  }
}
