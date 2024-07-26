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
  final UserEntity? user;
  const CoreLoaded({
    this.user,
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
