// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:ecom_app/src/features/settings/data/data_source/supabase_datasource.dart';
import 'package:ecom_app/src/features/settings/domain/repository/settings_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SettingsRepository)
class SupabaseRepositoryImpl implements SettingsRepository {
  final SupabaseSettingsDatasource dataSource;
  SupabaseRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<void> updateProfile({
    Uint8List? bytesImage,
    String? name,
    String? email,
  }) async {
    await dataSource.updateProfile(
      bytesImage: bytesImage,
      name: name,
      email: email,
    );
  }

  @override
  Future<void> changePassword({required newPassword}) async {
    await dataSource.changePassword(newPassword: newPassword);
  }
  
  @override
  Future<void> logOut()async {
    await dataSource.logOut();
  }
}
