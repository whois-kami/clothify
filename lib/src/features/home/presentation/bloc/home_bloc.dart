// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/core/domain/use_cases/dislike_usecase.dart';
import 'package:ecom_app/core/domain/use_cases/like_usecase.dart';
import 'package:ecom_app/src/features/home/domain/entities/category_entity.dart';
import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/src/features/home/domain/usecases/get_new_arrivals_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecom_app/src/features/home/domain/usecases/get_all_categories_usecase.dart';
import 'package:ecom_app/src/features/home/domain/usecases/get_all_products_by_category.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllProductsByCategoryUseCase productsByCategoryUseCase;
  final GetAllCategoriesUsecase allCategoriesUsecase;
  final GetNewArrivalsUsecase arrivalsUsecase;

  HomeBloc({
    required this.productsByCategoryUseCase,
    required this.allCategoriesUsecase,
    required this.arrivalsUsecase,
  }) : super(HomeInitial()) {
    on<GetAllProductsByCategoryEvent>(_getAllProductsByCategory);
    on<GetAllCategoriesEvent>(_getAllCategories);
    on<GetNewArrivalsEvent>(_getNewArrivals);
  }

  Future<void> _getAllProductsByCategory(
      GetAllProductsByCategoryEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
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
    emit(HomeLoading());
    try {
      final allCategories = await allCategoriesUsecase.execute();
      emit(HomeLoaded(categories: allCategories));
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }

  Future<void> _getNewArrivals(
      GetNewArrivalsEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final newArrivals = await arrivalsUsecase.execute();
      emit(HomeLoaded(products: newArrivals));
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }
}
