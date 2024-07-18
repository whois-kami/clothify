part of 'favorite_bloc.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();
  
  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}
