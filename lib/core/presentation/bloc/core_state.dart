part of 'core_bloc.dart';

sealed class CoreState extends Equatable {
  const CoreState();

  @override
  List<Object> get props => [];
}

final class CoreInitial extends CoreState {}

class CoreLoading extends CoreState {}

class CoreLoaded extends CoreState {}

class CoreFailure extends CoreState {
  final String message;
  const CoreFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
