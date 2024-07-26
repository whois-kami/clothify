import 'package:ecom_app/core/domain/use_cases/dislike_usecase.dart';
import 'package:ecom_app/core/domain/use_cases/get_profile_usecase.dart';
import 'package:ecom_app/core/domain/use_cases/like_usecase.dart';
import 'package:ecom_app/core/domain/use_cases/sync_with_db_usecase.dart';
import 'package:ecom_app/core/domain/entities/user_entity.dart';
import 'package:ecom_app/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'core_event.dart';
part 'core_state.dart';

@injectable
class CoreBloc extends Bloc<CoreEvent, CoreState> {
  final LikeUseCase likeUseCase;
  final DislikeUsecase dislikeUsecase;
  final SyncWithDbUsecase syncWithDbUsecase;
  final GetProfileUsecase getProfileUsecase;
  CoreBloc({
    required this.likeUseCase,
    required this.dislikeUsecase,
    required this.syncWithDbUsecase,
    required this.getProfileUsecase,
  }) : super(CoreInitial()) {
    on<DislikeProductEvent>(_dislikeProduct);
    on<LikeProductEvent>(_likeProduct);
    on<SyncWithDBEvent>(_syncWithDb);
    on<GetProfileEvent>(_getProfile);
  }

  Future<void> _dislikeProduct(
      DislikeProductEvent event, Emitter<CoreState> emit) async {
    emit(CoreLoading());
    try {
      await dislikeUsecase.execute(event.productId);
      emit(const CoreLoaded());
    } catch (e) {
      emit(CoreFailure(message: e.toString()));
    }
  }

  Future<void> _likeProduct(
      LikeProductEvent event, Emitter<CoreState> emit) async {
    emit(CoreLoading());
    try {
      await likeUseCase.execute(event.productId);
      emit(const CoreLoaded());
    } catch (e) {
      emit(CoreFailure(message: e.toString()));
    }
  }

  Future<void> _syncWithDb(
      SyncWithDBEvent event, Emitter<CoreState> emit) async {
    emit(CoreLoading());
    try {
      await syncWithDbUsecase.execute();
      emit(const CoreLoaded());
    } catch (e) {
      emit(CoreFailure(message: e.toString()));
    }
  }

  Future<void> _getProfile(
      GetProfileEvent event, Emitter<CoreState> emit) async {
    emit(CoreLoading());
    try {
      final userProfile = await getProfileUsecase.execute();
      emit(CoreLoaded(user: userProfile));
    } catch (e) {
      emit(CoreFailure(message: e.toString()));
    }
  }
}
