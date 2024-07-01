// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecom_app/src/features/auth/data/data_source/supabase_datasource.dart'
    as _i3;
import 'package:ecom_app/src/features/auth/data/repositories/supabase_auth_repository.dart'
    as _i6;
import 'package:ecom_app/src/features/auth/domain/repositories/auth_repository.dart'
    as _i5;
import 'package:ecom_app/src/features/auth/domain/usecases/email_verif_usecase.dart'
    as _i9;
import 'package:ecom_app/src/features/auth/domain/usecases/signin_usecase.dart'
    as _i7;
import 'package:ecom_app/src/features/auth/domain/usecases/signup_usecase.dart'
    as _i8;
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_bloc.dart'
    as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:supabase_flutter/supabase_flutter.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.SupabaseDataSource>(
        () => _i3.SupabaseDataSource(supabase: gh<_i4.SupabaseClient>()));
    gh.lazySingleton<_i5.AuthRepository>(() => _i6.SupabaseAuthRepositoryImpl(
        supabaseds: gh<_i3.SupabaseDataSource>()));
    gh.factory<_i7.SigninUsecase>(
        () => _i7.SigninUsecase(authRepository: gh<_i5.AuthRepository>()));
    gh.factory<_i8.SignupUsecase>(
        () => _i8.SignupUsecase(authRepository: gh<_i5.AuthRepository>()));
    gh.factory<_i9.EmailVerifUsecase>(
        () => _i9.EmailVerifUsecase(authRepository: gh<_i5.AuthRepository>()));
    gh.factory<_i10.AuthBloc>(() => _i10.AuthBloc(
          signinUsecase: gh<_i7.SigninUsecase>(),
          signupUsecase: gh<_i8.SignupUsecase>(),
          emailVerifUsecase: gh<_i9.EmailVerifUsecase>(),
        ));
    return this;
  }
}
