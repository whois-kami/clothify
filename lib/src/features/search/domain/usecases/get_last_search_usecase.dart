// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/search/domain/repository/search_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLastSearchUsecase {
  final SearchRepository searchRepository;
  GetLastSearchUsecase({
    required this.searchRepository,
  });

   Future<List<String>> execute() async {
    return searchRepository.getLastSearch();
  }
}
