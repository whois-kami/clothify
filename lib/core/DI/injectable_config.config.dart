// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecom_app/core/DI/injectable_config.dart' as _i18;
import 'package:ecom_app/src/features/auth/data/data_source/supabase_datasource.dart'
    as _i4;
import 'package:ecom_app/src/features/auth/data/repositories/supabase_auth_repository.dart'
    as _i12;
import 'package:ecom_app/src/features/auth/domain/repositories/auth_repository.dart'
    as _i11;
import 'package:ecom_app/src/features/auth/domain/usecases/email_verif_usecase.dart'
    as _i15;
import 'package:ecom_app/src/features/auth/domain/usecases/signin_usecase.dart'
    as _i13;
import 'package:ecom_app/src/features/auth/domain/usecases/signup_usecase.dart'
    as _i14;
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_bloc.dart'
    as _i17;
import 'package:ecom_app/src/features/home/data/data_source/supabase_datasource.dart'
    as _i5;
import 'package:ecom_app/src/features/home/data/repository/supabase_repository_impl.dart'
    as _i7;
import 'package:ecom_app/src/features/home/domain/repository/home_repository.dart'
    as _i6;
import 'package:ecom_app/src/features/home/domain/usecases/get_all_categories_usecase.dart'
    as _i8;
import 'package:ecom_app/src/features/home/domain/usecases/get_all_products_by_category.dart'
    as _i9;
import 'package:ecom_app/src/features/home/domain/usecases/get_new_arrivals_usecase.dart'
    as _i10;
import 'package:ecom_app/src/features/home/presentation/bloc/home_bloc.dart'
    as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:supabase_flutter/supabase_flutter.dart' as _i3;

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
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.SupabaseClient>(() => registerModule.supabaseClient);
    gh.lazySingleton<_i4.SupabaseAuthDataSource>(
        () => _i4.SupabaseAuthDataSource(supabase: gh<_i3.SupabaseClient>()));
    gh.lazySingleton<_i5.SupabaseHomeDataSource>(
        () => _i5.SupabaseHomeDataSource(supabase: gh<_i3.SupabaseClient>()));
    gh.lazySingleton<_i6.HomeRepository>(() => _i7.SupabaseRepositoryImpl(
        dataSource: gh<_i5.SupabaseHomeDataSource>()));
    gh.factory<_i8.GetAllCategoriesUsecase>(() =>
        _i8.GetAllCategoriesUsecase(homeRepository: gh<_i6.HomeRepository>()));
    gh.factory<_i9.GetAllProductsByCategoryUseCase>(() =>
        _i9.GetAllProductsByCategoryUseCase(
            homeRepository: gh<_i6.HomeRepository>()));
    gh.factory<_i10.GetNewArrivalsUsecase>(() =>
        _i10.GetNewArrivalsUsecase(homeRepository: gh<_i6.HomeRepository>()));
    gh.lazySingleton<_i11.AuthRepository>(() => _i12.SupabaseAuthRepositoryImpl(
        supabaseds: gh<_i4.SupabaseAuthDataSource>()));
    gh.factory<_i13.SigninUsecase>(
        () => _i13.SigninUsecase(authRepository: gh<_i11.AuthRepository>()));
    gh.factory<_i14.SignupUsecase>(
        () => _i14.SignupUsecase(authRepository: gh<_i11.AuthRepository>()));
    gh.factory<_i15.EmailVerifUsecase>(() =>
        _i15.EmailVerifUsecase(authRepository: gh<_i11.AuthRepository>()));
    gh.factory<_i16.HomeBloc>(() => _i16.HomeBloc(
          productsByCategoryUseCase: gh<_i9.GetAllProductsByCategoryUseCase>(),
          allCategoriesUsecase: gh<_i8.GetAllCategoriesUsecase>(),
          arrivalsUsecase: gh<_i10.GetNewArrivalsUsecase>(),
        ));
    gh.factory<_i17.AuthBloc>(() => _i17.AuthBloc(
          signinUsecase: gh<_i13.SigninUsecase>(),
          signupUsecase: gh<_i14.SignupUsecase>(),
          emailVerifUsecase: gh<_i15.EmailVerifUsecase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i18.RegisterModule {}
