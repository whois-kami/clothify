import 'dart:async';
import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/src/features/favorites/domain/use_case/get_favorite_products_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

@injectable
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetFavoriteProductsUsecase favoriteRepository;
  FavoriteBloc({
    required this.favoriteRepository,
  }) : super(FavoriteInitial()) {
    on<InitGetFavoritesProducts>(_getFavoriteProducts);
    on<DeleteFavoriteProducts>(_deleteFavoriteProducts);
  }

  Future<void> _getFavoriteProducts(
      InitGetFavoritesProducts event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    try {
      final favoriteProducts = await favoriteRepository.execute();
      emit(FavoriteLoaded(favoriteProducts: favoriteProducts));
    } catch (e) {
      emit(FavoriteFailure(message: e.toString()));
    }
  }

 Future<void> _deleteFavoriteProducts(
      DeleteFavoriteProducts event, Emitter<FavoriteState> emit) async {
    try {
      final favoriteProducts = await favoriteRepository.execute();
      emit(FavoriteLoaded(favoriteProducts: favoriteProducts));
    } catch (e) {
      emit(FavoriteFailure(message: e.toString()));
    }
  }

}
