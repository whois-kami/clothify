import 'package:ecom_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddUserInfoUsecase {
  final AuthRepository authRepository;

  AddUserInfoUsecase({required this.authRepository});

  Future<void> execute(String name) async {
    if (name.isEmpty) {
      throw Exception('Invalid input');
    }

    await authRepository.addUserInfo(name);
  }
}
