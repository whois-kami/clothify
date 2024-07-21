import 'package:ecom_app/core/domain/repostitory/core_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SyncWithDbUsecase {
  final CoreRepository coreRepository;

  SyncWithDbUsecase({required this.coreRepository});

  Future<void> execute() async {
    await coreRepository.syncWithDb();
  }
}
