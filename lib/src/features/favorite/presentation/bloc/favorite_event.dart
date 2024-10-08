// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class InitGetFavoritesProducts extends FavoriteEvent {}

class DeleteFavoriteProducts extends FavoriteEvent {}

class GetFilteredItemsEvent extends FavoriteEvent {
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

class GetFilteredTagItemsEvent extends FavoriteEvent {
  final List<String> query;
  const GetFilteredTagItemsEvent({
    required this.query,
  });

   @override
  List<Object> get props => [query];
}
