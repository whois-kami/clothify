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

