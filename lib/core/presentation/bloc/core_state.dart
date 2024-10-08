// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'core_bloc.dart';

sealed class CoreState extends Equatable {
  const CoreState();

  @override
  List<Object> get props => [];
}

final class CoreInitial extends CoreState {}

class CoreLoading extends CoreState {}

class CoreLoaded extends CoreState {
  final List<String>? lastSearch;
  final List<ProductEntity>? products;
  final int? productCount;
  final String? productId;
  const CoreLoaded({
    this.lastSearch,
    this.products,
    this.productCount,
    this.productId,
  });
}

class CoreFailure extends CoreState {
  final String message;
  const CoreFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class ProfileLoaded extends CoreState {
  final UserEntity? user;
  const ProfileLoaded({
    this.user,
  });
}
