// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:ecom_app/src/features/settings/domain/repository/settings_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateProfilePhotoUsecase {
  final SettingsRepository settingsRepository;
  UpdateProfilePhotoUsecase({
    required this.settingsRepository,
  });

  Future<void> execute({
    Uint8List? bytesImage,
    String? name,
    String? email,
  }) async {
    await settingsRepository.updateProfile(
      bytesImage: bytesImage,
      name: name,
      email: email,
    );
  }
}
