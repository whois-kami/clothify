import 'dart:async';

import 'package:ecom_app/src/features/auth/domain/usecases/email_verif_usecase.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/signin_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';

@injectable
class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  SigninUsecase signinUsecase;
  SignupUsecase signupUsecase;
  EmailVerifUsecase emailVerifUsecase;
  AuthBloc({
    required this.signinUsecase,
    required this.signupUsecase,
    required this.emailVerifUsecase,
  }) : super(AuthInitial()) {
    on<SignUpEvent>(_signUp);
    on<SignInEvent>(_signIn);
    on<ConfirmEmailEvent>(_emailVerif);
  }

  Future<void> _signUp(SignUpEvent event, Emitter<AuthBlocState> emit) async {
    emit(AuthLoading());
    try {
      UserData user = UserData(
          name: event.name, email: event.email, password: event.password);
      await signupUsecase.execute(user);
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  Future<void> _signIn(SignInEvent event, Emitter<AuthBlocState> emit) async {
    emit(AuthLoading());
    try {
      UserData user = UserData(email: event.email, password: event.password);
      await signinUsecase.execute(user);
      emit(AuthLoaded());
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  void _emailVerif(ConfirmEmailEvent event, Emitter<AuthBlocState> emit) {
    emit(AuthLoading());

    StreamSubscription? authSubscription;

    try {
      final authStream = emailVerifUsecase.execute();
      final authSubscription = authStream.listen((data) {
        final AuthChangeEvent event = data.event;
        final Session? session = data.session;

        switch (event) {
          case AuthChangeEvent.initialSession:
            // handle initial session
            break;
          case AuthChangeEvent.signedIn:
            emit(AuthLoaded());
            break;
          case AuthChangeEvent.signedOut:
            // handle sign out event
            break;
          case AuthChangeEvent.passwordRecovery:
            // handle password recovery event
            break;
          case AuthChangeEvent.tokenRefreshed:
            // handle token refreshed event
            break;
          case AuthChangeEvent.userUpdated:
            // handle user updated event
            break;
          default:
            // handle unknown event
            break;
        }
      });
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    } finally {
      if (authSubscription != null) {
        authSubscription.cancel();
      }
    }
  }
}
