part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  final int? activeTab;

  const HomeLoading({this.activeTab});
}

class HomeLoaded extends HomeState {
  List<ProductEntity>? products;
  List<CategoryEntity>? categories;
  List<String>? lastSearch;
  HomeLoaded({
    this.products,
    this.categories,
    this.lastSearch
  });
}

class HomeFailure extends HomeState {
  final String message;
  const HomeFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
