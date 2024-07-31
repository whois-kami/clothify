// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetAllProductsByCategoryEvent extends HomeEvent {
  final String categoryName;
  const GetAllProductsByCategoryEvent({
    required this.categoryName,
  });

  @override
  List<Object> get props => [categoryName];
}

class GetAllCategoriesEvent extends HomeEvent {}

class GetNewArrivalsEvent extends HomeEvent {}

class GetLastSearchEvent extends HomeEvent {}

class AddLastSearchEvent extends HomeEvent {
  final String query;
  const AddLastSearchEvent({
    required this.query,
  });

  @override
  List<Object> get props => [query];
}

class GetSearchItemsEvent extends HomeEvent {
  final String query;
  const GetSearchItemsEvent({
    required this.query,
  });

  @override
  List<Object> get props => [query];
}

class GetFilteredTagItemsEvent extends HomeEvent {
  final List<String> query;
  final List<ProductEntity> products;
  const GetFilteredTagItemsEvent({
    required this.query,
    required this.products,
  });
  @override
  List<Object> get props => [query, products];
}

class GetFilteredItemsEvent extends HomeEvent {
  final int minPrice;
  final int maxPrice;
  final String selectedColor;
  final String selectedLocation;
  const GetFilteredItemsEvent({
    required this.maxPrice,
    required this.minPrice,
    required this.selectedColor,
    required this.selectedLocation,
  });
  @override
  List<Object> get props => [
        minPrice,
        maxPrice,
        selectedColor,
        selectedLocation,
      ];
}
