// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecom_app/src/features/settings/domain/repository/settings_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUsecase {
  final SettingsRepository settingsRepository;
  ChangePasswordUsecase({
    required this.settingsRepository,
  });

  Future<void> execute({required newPassword}) async {
    await settingsRepository.changePassword(
      newPassword: newPassword,
    );
  }
}
