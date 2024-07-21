part of 'favorite_bloc.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  List<ProductEntity> favoriteProducts;
  FavoriteLoaded({
    required this.favoriteProducts,
  });

  @override
  List<Object> get props => [favoriteProducts];
}

class FavoriteFailure extends FavoriteState {
  final String message;
  const FavoriteFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
