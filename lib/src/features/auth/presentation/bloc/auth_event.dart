// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

sealed class AuthBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpEvent extends AuthBlocEvent {
  final String email;

  final String password;

  SignUpEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [ email, password];
}

class SignInEvent extends AuthBlocEvent {
  final String email;
  final String password;

  SignInEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

class ConfirmEmailEvent extends AuthBlocEvent {
  @override
  List<Object?> get props => [];
}

class AddUserInfoEvent extends AuthBlocEvent {
  final String name;
  AddUserInfoEvent({
    required this.name,
  });
  @override
  List<Object?> get props => [name];
}

class CheckEmailEvent extends AuthBlocEvent {}