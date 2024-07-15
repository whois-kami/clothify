part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  List<ProductEntity>? products;
  List<CategoryEntity>? categories;
  HomeLoaded({
    this.products,
    this.categories,
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
