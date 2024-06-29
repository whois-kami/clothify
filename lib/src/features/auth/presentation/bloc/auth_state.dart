import 'package:equatable/equatable.dart';

sealed class AuthBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthBlocState {}

class AuthLoading extends AuthBlocState {}

class AuthLoaded extends AuthBlocState {}

class AuthFailure extends AuthBlocState {
  final String message;

  AuthFailure({required this.message});
  @override
  List<Object?> get props => [message];
}
