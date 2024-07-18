import 'package:ecom_app/core/domain/use_cases/dislike_usecase.dart';
import 'package:ecom_app/core/domain/use_cases/like_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'core_event.dart';
part 'core_state.dart';

@injectable
class CoreBloc extends Bloc<CoreEvent, CoreState> {
  final LikeUseCase likeUseCase;
  final DislikeUsecase dislikeUsecase;
  CoreBloc({required this.likeUseCase, required this.dislikeUsecase})
      : super(CoreInitial()) {
    on<DislikeProductEvent>(_dislikeProduct);
    on<LikeProductEvent>(_likeProduct);
  }

  Future<void> _dislikeProduct(
      DislikeProductEvent event, Emitter<CoreState> emit) async {
    emit(CoreLoading());
    try {
      await dislikeUsecase.execute(event.productId);
    } catch (e) {
      emit(CoreFailure(message: e.toString()));
    }
  }

  Future<void> _likeProduct(
      LikeProductEvent event, Emitter<CoreState> emit) async {
    emit(CoreLoading());
    try {
      await likeUseCase.execute(event.productId);
    } catch (e) {
      emit(CoreFailure(message: e.toString()));
    }
  }
}
