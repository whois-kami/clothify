part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}


class GetLastSearchEvent extends SearchEvent {}

class AddLastSearchEvent extends SearchEvent {
  final String query;
  const AddLastSearchEvent({
    required this.query,
  });

  @override
  List<Object> get props => [query];
}

class GetSearchItemsEvent extends SearchEvent {
  final String query;
  const GetSearchItemsEvent({
    required this.query,
  });

  @override
  List<Object> get props => [query];
}

class GetPreviosSearchItemsEvent extends SearchEvent {}

class GetFilteredTagItemsEvent extends SearchEvent {
  final List<String> query;
  final List<ProductEntity> products;
  const GetFilteredTagItemsEvent({
    required this.query,
    required this.products,
  });
  @override
  List<Object> get props => [query, products];
}

class GetFilteredItemsEvent extends SearchEvent {
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