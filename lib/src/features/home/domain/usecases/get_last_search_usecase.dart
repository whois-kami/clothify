// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLastSearchUsecase {
  final HomeRepository homeRepository;
  GetLastSearchUsecase({
    required this.homeRepository,
  });

   Future<List<String>> execute() async {
    return homeRepository.getLastSearch();
  }
}
