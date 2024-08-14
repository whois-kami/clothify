import 'dart:async';
import 'dart:developer';
import 'package:ecom_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
class CheckEmailVerifUseCase {
  final AuthRepository authRepository;

  CheckEmailVerifUseCase({required this.authRepository});

  Future<bool> execute() async {
    final Completer<bool> completer = Completer<bool>();
    StreamSubscription<AuthState>? subscription;

    try {
      final Stream<AuthState> verificationStream =
          await authRepository.checkEmailVerif();

      subscription = verificationStream.listen(
        (authState) {
          log('Подписка на стрим прослушивается.');
          final AuthChangeEvent event = authState.event;
          final Session? session = authState.session;

          log('session: $session, event: $event');
          if ( session?.user.emailConfirmedAt != null && session != null) {
            log('User has a verified email.');
            if (!completer.isCompleted) {
              completer.complete(true);
              log('Вышел из стрима: Пользователь вошел в систему и email подтвержден.');
            }
          } else {
            log('User is not signed in or email is not verified.');
          }
        },
        onError: (error) {
          log('An error occurred during stream listening: $error');
          if (!completer.isCompleted) {
            completer.complete(false);
            log('Вышел из стрима: Произошла ошибка - $error');
          }
        },
      );

      log('Ожидание завершения стрима...');
      return await completer.future;
    } catch (e) {
      log('Вышел из стрима с исключением в блоке try: $e');
      return false;
    } finally {
      await subscription?.cancel();
      log('Подписка на стрим была отменена.');
    }
  }
}
