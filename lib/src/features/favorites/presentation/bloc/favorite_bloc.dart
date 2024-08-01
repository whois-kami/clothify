import 'dart:async';
import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/src/features/favorites/domain/use_case/get_favorite_products_usecase.dart';
import 'package:ecom_app/src/features/favorites/domain/use_case/get_filtered_items_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

@injectable
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetFavoriteProductsUsecase favoriteRepository;
  final GetFilteredItemsUsecase getFilteredItemsUsecase;
  FavoriteBloc({
    required this.getFilteredItemsUsecase,
    required this.favoriteRepository,
  }) : super(FavoriteInitial()) {
    on<InitGetFavoritesProducts>(_getFavoriteProducts);
    on<DeleteFavoriteProducts>(_deleteFavoriteProducts);
    on<GetFilteredItemsEvent>(_getFilteredItems);
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

  Future<void> _getFilteredItems(
      GetFilteredItemsEvent event, Emitter<FavoriteState> emit) async {
    try {
      List<ProductEntity> currentProducts = [];
      if (state is FavoriteLoaded) {
        currentProducts = (state as FavoriteLoaded).favoriteProducts;
      }
      emit(FavoriteLoading());
      List<int> currentProductIds =
          currentProducts.map((product) => product.id).toList();
      final filteredProducts = await getFilteredItemsUsecase.execute(
        minPrice: event.minPrice,
        maxPrice: event.maxPrice,
        selectedColor: event.selectedColor,
        selectedLocation: event.selectedLocation,
        productIds: currentProductIds,
      );

      emit(FavoriteLoaded(favoriteProducts: filteredProducts));
    } catch (e) {
      emit(FavoriteFailure(message: e.toString()));
    }
  }
}
