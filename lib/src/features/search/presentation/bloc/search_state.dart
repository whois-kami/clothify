// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<ProductEntity> products;
  const SearchLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class SearchFailure extends SearchState {
  final String message;
  const SearchFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class LastSearchLoaded extends SearchState {
  final List<String> lastSearch;
  const LastSearchLoaded({
    required this.lastSearch,
  });

  @override
  List<Object> get props => [lastSearch];
}
