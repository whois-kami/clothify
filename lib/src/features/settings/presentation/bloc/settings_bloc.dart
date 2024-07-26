import 'dart:typed_data';

import 'package:ecom_app/core/domain/entities/user_entity.dart';
import 'package:ecom_app/src/features/settings/domain/use_cases/update_profile_photo_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final UpdateProfilePhotoUsecase updateProfilePhotoUsecase;
  SettingsBloc({
    required this.updateProfilePhotoUsecase,
  }) : super(SettingsInitial()) {
    on<UpdateProfilePhotoEvent>(_updateProfilePhoto);
  }
  Future<void> _updateProfilePhoto(
      UpdateProfilePhotoEvent event, Emitter<SettingsState> emit) async {
    emit(SettingsLoading());
    try {
      await updateProfilePhotoUsecase.execute(
        bytesImage: event.imageBytes,
        name: event.name,
        email: event.email,
      );
      emit(SettingsLoaded());
    } catch (e) {
      emit(SettingsFailure(message: e.toString()));
    }
  }
}
