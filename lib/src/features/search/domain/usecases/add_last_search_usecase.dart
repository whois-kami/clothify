// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/search/domain/repository/search_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddLastSearchUsecase {
  final SearchRepository searchRepository;
  AddLastSearchUsecase({
    required this.searchRepository,
  });

  Future<void> execute({required String query}) async {
    return searchRepository.addLastSearch(query: query);
  }
}
