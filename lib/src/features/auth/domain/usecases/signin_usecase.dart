import 'package:ecom_app/src/features/auth/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

import '../repositories/auth_repository.dart';

@injectable
class SigninUsecase {
  final AuthRepository authRepository;

  SigninUsecase({required this.authRepository});

  Future<void> execute(UserData user) async {
    if (user.email.isEmpty || user.password.isEmpty) {
      throw Exception('Invalid input');
    }
    await authRepository.signIn(user.email, user.password);
  }
}
