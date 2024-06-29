import 'package:injectable/injectable.dart';

import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

@injectable
class SignupUsecase {
  final AuthRepository authRepository;

  SignupUsecase({required this.authRepository});

  Future<void> execute(UserData user) async {
    if (user.name!.isEmpty || user.email.isEmpty || user.password.isEmpty) {
      throw Exception('Invalid input');
    }

    await authRepository.signUp(user.name!, user.email, user.password);
  }
}
