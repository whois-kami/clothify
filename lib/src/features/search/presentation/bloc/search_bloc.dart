// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/src/features/search/domain/usecases/add_last_search_usecase.dart';
import 'package:ecom_app/src/features/search/domain/usecases/get_filtered_items_usecase.dart';
import 'package:ecom_app/src/features/search/domain/usecases/get_last_search_usecase.dart';
import 'package:ecom_app/src/features/search/domain/usecases/get_search_items_usecase.dart';
import 'package:injectable/injectable.dart';

part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetLastSearchUsecase getLastSearchUsecase;
  final AddLastSearchUsecase addLastSearchUsecase;
  final GetSearchItemsUsecase getSearchItemsUsecase;
  final GetFilteredItemsUsecase getFilteredItemsUsecase;
  SearchBloc({
    required this.getLastSearchUsecase,
    required this.addLastSearchUsecase,
    required this.getSearchItemsUsecase,
    required this.getFilteredItemsUsecase,
  }) : super(SearchInitial()) {
    on<AddLastSearchEvent>(_addLastSearch);
    on<GetLastSearchEvent>(_getLastSearch);
    on<GetSearchItemsEvent>(_getSearchItems);
    on<GetFilteredTagItemsEvent>(_getFilteredTagItems);
    on<GetFilteredItemsEvent>(_getFilteredItems);
    on<GetPreviosSearchItemsEvent>(_getPreviosSearchItems);
  }

  Future<void> _addLastSearch(
      AddLastSearchEvent event, Emitter<SearchState> emit) async {
    try {
      await addLastSearchUsecase.execute(query: event.query);
    } catch (e) {
      emit(SearchFailure(message: e.toString()));
    }
  }

  Future<void> _getLastSearch(
      GetLastSearchEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
      final lastSearch = await getLastSearchUsecase.execute();
      emit(LastSearchLoaded(lastSearch: lastSearch));
    } catch (e) {
      emit(SearchFailure(message: e.toString()));
    }
  }

  void _getPreviosSearchItems(
      GetPreviosSearchItemsEvent event, Emitter<SearchState> emit) {
    try {
      if (state is SearchLoaded) {
        final currentState = state as SearchLoaded;
        final products = currentState.products;
        emit(SearchLoading());
        emit(SearchLoaded(products: products));
      }
    } catch (e) {
      emit(SearchFailure(message: e.toString()));
    }
  }

  Future<void> _getSearchItems(
      GetSearchItemsEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
      final products = await getSearchItemsUsecase.execute(query: event.query);
      emit(SearchLoaded(products: products));
    } catch (e) {
      emit(SearchFailure(message: e.toString()));
    }
  }

  Future<void> _getFilteredTagItems(
      GetFilteredTagItemsEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
      final filteredProducts = _filterTagProducts(event.query, event.products);
      emit(SearchLoaded(products: filteredProducts));
    } catch (e) {
      emit(SearchFailure(message: e.toString()));
    }
  }

  List<ProductEntity> _filterTagProducts(
      List<String> query, List<ProductEntity> products) {
    List<ProductEntity> filteredProducts = products;

    if (query.contains('Latest')) {
      filteredProducts.sort((a, b) => b.releaseDate.compareTo(a.releaseDate));
    } else if (query.contains('Most Popular')) {
      filteredProducts.sort((a, b) => b.views.compareTo(a.views));
    } else if (query.contains('Cheapest')) {
      filteredProducts.sort((a, b) => a.price.compareTo(b.price));
    } else if (query.contains('Dearest')) {
      filteredProducts.sort((a, b) => b.price.compareTo(a.price));
    }

    return filteredProducts;
  }

  Future<void> _getFilteredItems(
      GetFilteredItemsEvent event, Emitter<SearchState> emit) async {
    try {
      List<ProductEntity> currentProducts = [];
      if (state is SearchLoaded) {
        currentProducts = (state as SearchLoaded).products;
      }
      emit(SearchLoading());
      List<int> currentProductIds =
          currentProducts.map((product) => product.id).toList();
      final filteredProducts = await getFilteredItemsUsecase.execute(
        minPrice: event.minPrice,
        maxPrice: event.maxPrice,
        selectedColor: event.selectedColor,
        selectedLocation: event.selectedLocation,
        productIds: currentProductIds,
      );

      emit(SearchLoaded(products: filteredProducts));
    } catch (e) {
      emit(SearchFailure(message: e.toString()));
    }
  }
}
