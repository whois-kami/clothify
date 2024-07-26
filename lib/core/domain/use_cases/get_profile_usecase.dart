import 'package:ecom_app/core/domain/entities/user_entity.dart';
import 'package:ecom_app/core/domain/repostitory/core_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProfileUsecase {
  final CoreRepository coreRepository;

  GetProfileUsecase({required this.coreRepository});

  Future<UserEntity> execute() async {
   return await coreRepository.getProfile();
  }
}
