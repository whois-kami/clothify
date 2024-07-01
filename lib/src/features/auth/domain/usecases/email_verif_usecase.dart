import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../repositories/auth_repository.dart';

@injectable
class EmailVerifUsecase {
  final AuthRepository authRepository;

  EmailVerifUsecase({required this.authRepository});

  Stream<AuthState> execute()  {
    return authRepository.emailVerif();
  }
}
