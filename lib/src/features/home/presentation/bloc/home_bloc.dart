// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/src/features/home/domain/entities/category_entity.dart';
import 'package:ecom_app/src/features/home/domain/usecases/add_last_search_usecase.dart';
import 'package:ecom_app/src/features/home/domain/usecases/get_all_categories_usecase.dart';
import 'package:ecom_app/src/features/home/domain/usecases/get_all_products_by_category.dart';
import 'package:ecom_app/src/features/home/domain/usecases/get_last_search_usecase.dart';
import 'package:ecom_app/src/features/home/domain/usecases/get_new_arrivals_usecase.dart';
import 'package:ecom_app/src/features/home/domain/usecases/get_search_items_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllProductsByCategoryUseCase productsByCategoryUseCase;
  final GetAllCategoriesUsecase allCategoriesUsecase;
  final GetNewArrivalsUsecase arrivalsUsecase;
  final GetLastSearchUsecase getLastSearchUsecase;
  final AddLastSearchUsecase addLastSearchUsecase;
  final GetSearchItemsUsecase getSearchItemsUsecase;

  HomeBloc({
    required this.productsByCategoryUseCase,
    required this.allCategoriesUsecase,
    required this.arrivalsUsecase,
    required this.getLastSearchUsecase,
    required this.addLastSearchUsecase,
    required this.getSearchItemsUsecase,
  }) : super(HomeInitial()) {
    on<GetAllProductsByCategoryEvent>(_getAllProductsByCategory);
    on<GetAllCategoriesEvent>(_getAllCategories);
    on<GetNewArrivalsEvent>(_getNewArrivals);
    on<AddLastSearchEvent>(_addLastSearch);
    on<GetLastSearchEvent>(_getLastSearch);
    on<GetSearchItemsEvent>(_getSearchItems);
    on<GetFilteredItemsEvent>(_getFilteredItems);
  }

  Future<void> _getAllProductsByCategory(
      GetAllProductsByCategoryEvent event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());
    try {
      final productsByCategory = await productsByCategoryUseCase.execute(
          categoryName: event.categoryName);
      emit(HomeLoaded(products: productsByCategory));
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }

  Future<void> _getAllCategories(
      GetAllCategoriesEvent event, Emitter<HomeState> emit) async {
    emit(const HomeLoading(activeTab: 1));
    try {
      final allCategories = await allCategoriesUsecase.execute();
      emit(HomeLoaded(categories: allCategories));
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }

  Future<void> _getNewArrivals(
      GetNewArrivalsEvent event, Emitter<HomeState> emit) async {
    emit(const HomeLoading(activeTab: 0));
    try {
      final newArrivals = await arrivalsUsecase.execute();
      emit(HomeLoaded(products: newArrivals));
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }

  Future<void> _addLastSearch(
      AddLastSearchEvent event, Emitter<HomeState> emit) async {
    try {
      await addLastSearchUsecase.execute(query: event.query);
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }

  Future<void> _getLastSearch(
      GetLastSearchEvent event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());
    try {
      final lastSearch = await getLastSearchUsecase.execute();
      emit(HomeLoaded(lastSearch: lastSearch));
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }

  Future<void> _getSearchItems(
      GetSearchItemsEvent event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());
    try {
      final products = await getSearchItemsUsecase.execute(query: event.query);
      emit(HomeLoaded(products: products));
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }

 Future<void> _getFilteredItems(
      GetFilteredItemsEvent event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());
    try {
          final filteredProducts = _filterProducts(event.query, event.products);
      emit(HomeLoaded(products: filteredProducts));
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }


List<ProductEntity> _filterProducts(List<String> query, List<ProductEntity> products) {
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



}
