import 'package:ecom_app/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/signin_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';

@injectable
class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  SigninUsecase signinUsecase;
  SignupUsecase signupUsecase;
  AuthBloc({
    required this.signinUsecase,
    required this.signupUsecase,
  }) : super(AuthInitial()) {
    on<SignUpEvent>(_signUp);
    on<SignInEvent>(_signIn);
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
      UserData user = UserData(
           email: event.email, password: event.password);
      await signinUsecase.execute(user);
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

}
