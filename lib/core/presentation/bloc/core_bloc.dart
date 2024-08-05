// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/core/domain/use_cases/decrement_count_product_usecase.dart';
import 'package:ecom_app/core/domain/use_cases/get_all_shoping_cart_usecase.dart';
import 'package:ecom_app/core/domain/use_cases/get_count_product_usecase.dart';
import 'package:ecom_app/core/domain/use_cases/increment_count_product_usecase.dart';
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
  final GetAllShopingCartUsecase getAllShopingCartUsecase;
  final IncrementCountProductUsecase incrementCountProductUsecase;
  final DecrementCountProductUsecase decrementCountProductUsecase;
  final GetCountProductUsecase getCountProductUsecase;
  CoreBloc({
    required this.getAllShopingCartUsecase,
    required this.incrementCountProductUsecase,
    required this.decrementCountProductUsecase,
    required this.likeUseCase,
    required this.dislikeUsecase,
    required this.syncWithDbUsecase,
    required this.getProfileUsecase,
    required this.addLastSearchUsecase,
    required this.getLastSearchUsecase,
    required this.getSearchItemsUsecase,
    required this.getCountProductUsecase,
  }) : super(CoreInitial()) {
    on<DislikeProductEvent>(_dislikeProduct);
    on<LikeProductEvent>(_likeProduct);
    on<SyncWithDBEvent>(_syncWithDb);
    on<GetProfileEvent>(_getProfile);
    on<DecrementCountProductEvent>(_decrementCountProduct);
    on<IncrementCountProductEvent>(_incrementCountProduct);
    on<GetCountProductEvent>(_getCountProduct);
    // on<GetAllShopingCartEvent>(_getAllShopingCart);
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

  Future<void> _incrementCountProduct(
      IncrementCountProductEvent event, Emitter<CoreState> emit) async {
    emit(CoreLoading());
    try {
      final newCount =
          await incrementCountProductUsecase.execute(event.productId);
      emit(CoreLoaded(productId: event.productId, productCount: newCount));
    } catch (e) {
      emit(CoreFailure(message: e.toString()));
    }
  }

  Future<void> _decrementCountProduct(
      DecrementCountProductEvent event, Emitter<CoreState> emit) async {
    emit(CoreLoading());
    try {
      final newCount =
          await decrementCountProductUsecase.execute(event.productId);
      emit(CoreLoaded(productId: event.productId, productCount: newCount));
    } catch (e) {
      emit(CoreFailure(message: e.toString()));
    }
  }

  Future<void> _getCountProduct(
      GetCountProductEvent event, Emitter<CoreState> emit) async {
    emit(CoreLoading());
    try {
      final count = await getCountProductUsecase.execute(event.productId);
      emit(CoreLoaded(productId: event.productId, productCount: count));
    } catch (e) {
      emit(CoreFailure(message: e.toString()));
    }
  }
}
