import 'dart:async';

import 'package:ecom_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckEmailVerifUseCase {
  final AuthRepository authRepository;

  CheckEmailVerifUseCase({required this.authRepository});

  Future<bool> execute() async {
    final completer = Completer<bool>();

    try {
      final stream = await authRepository.checkEmailVerif();

      final subscription = stream.listen(
        (isVerified) {
          if (isVerified) {
            if (!completer.isCompleted) {
              completer.complete(true);
            }
          }
        },
        onError: (error) {
          if (!completer.isCompleted) {
            completer.completeError(error);
          }
        },
        onDone: () {
          if (!completer.isCompleted) {
            completer.complete(false);
          }
        },
      );

      completer.future.whenComplete(() {
        subscription.cancel();
      });

      return completer.future;
    } catch (e) {
      return Future.error('An error occurred: $e');
    }
  }
}
