// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:ecom_app/core/domain/entities/user_entity.dart';
import 'package:ecom_app/src/features/home/domain/usecases/add_last_search_usecase.dart';
import 'package:ecom_app/core/domain/use_cases/dislike_usecase.dart';
import 'package:ecom_app/src/features/home/domain/usecases/get_last_search_usecase.dart';
import 'package:ecom_app/core/domain/use_cases/get_profile_usecase.dart';
import 'package:ecom_app/src/features/home/domain/usecases/get_search_items_usecase.dart';
import 'package:ecom_app/core/domain/use_cases/like_usecase.dart';
import 'package:ecom_app/core/domain/use_cases/sync_with_db_usecase.dart';

part 'core_event.dart';
part 'core_state.dart';

@injectable
class CoreBloc extends Bloc<CoreEvent, CoreState> {
  final LikeUseCase likeUseCase;
  final DislikeUsecase dislikeUsecase;
  final SyncWithDbUsecase syncWithDbUsecase;
  final GetProfileUsecase getProfileUsecase;
  final AddLastSearchUsecase addLastSearchUsecase;
  final GetLastSearchUsecase getLastSearchUsecase;
  final GetSearchItemsUsecase getSearchItemsUsecase;
  CoreBloc({
    required this.likeUseCase,
    required this.dislikeUsecase,
    required this.syncWithDbUsecase,
    required this.getProfileUsecase,
    required this.addLastSearchUsecase,
    required this.getLastSearchUsecase,
    required this.getSearchItemsUsecase,
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
    try {
      await syncWithDbUsecase.execute();
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
