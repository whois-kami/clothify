import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class UserData extends Equatable {
  final String? name;
  final String email;
  final String password;
  const UserData({
    this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
