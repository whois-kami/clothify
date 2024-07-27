// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfilePhotoEvent extends SettingsEvent {
  final Uint8List? imageBytes;
  final String? name;
  final String? email;
  const UpdateProfilePhotoEvent({
    required this.imageBytes,
    required this.name,
    required this.email,
  });
}

class ChangePasswordEvent extends SettingsEvent {
  final String newPassword;
  const ChangePasswordEvent({
    required this.newPassword,
  });

  @override
  List<Object> get props => [newPassword];
}
