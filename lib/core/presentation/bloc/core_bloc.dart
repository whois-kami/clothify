import 'package:ecom_app/core/domain/use_cases/dislike_usecase.dart';
import 'package:ecom_app/core/domain/use_cases/like_usecase.dart';
import 'package:ecom_app/core/domain/use_cases/sync_with_db_usecase.dart';
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
  CoreBloc({
    required this.likeUseCase,
    required this.dislikeUsecase,
    required this.syncWithDbUsecase,
  }) : super(CoreInitial()) {
    on<DislikeProductEvent>(_dislikeProduct);
    on<LikeProductEvent>(_likeProduct);
    on<SyncWithDBEvent>(_syncWithDb);
  }

  Future<void> _dislikeProduct(
      DislikeProductEvent event, Emitter<CoreState> emit) async {
    emit(CoreLoading());
    try {
      await dislikeUsecase.execute(event.productId);
      emit(CoreLoaded());
    } catch (e) {
      emit(CoreFailure(message: e.toString()));
    }
  }

  Future<void> _likeProduct(
      LikeProductEvent event, Emitter<CoreState> emit) async {
    emit(CoreLoading());
    try {
      await likeUseCase.execute(event.productId);
      emit(CoreLoaded());
    } catch (e) {
      emit(CoreFailure(message: e.toString()));
    }
  }

  Future<void> _syncWithDb(
      SyncWithDBEvent event, Emitter<CoreState> emit) async {
    emit(CoreLoading());
    try {
      await syncWithDbUsecase.execute();
      emit(CoreLoaded());
    } catch (e) {
      emit(CoreFailure(message: e.toString()));
    }
  }
}
