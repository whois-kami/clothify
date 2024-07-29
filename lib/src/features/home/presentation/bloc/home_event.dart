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
