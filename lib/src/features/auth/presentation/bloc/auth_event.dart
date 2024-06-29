import 'package:equatable/equatable.dart';

sealed class AuthBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpEvent extends AuthBlocEvent {
  final String name;
  final String email;

  final String password;

  SignUpEvent({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, password];
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