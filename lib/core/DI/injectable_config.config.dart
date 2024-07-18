// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecom_app/core/data/data_source/supabase_repository.dart' as _i4;
import 'package:ecom_app/core/data/repository/supabase_repostitory_impl.dart'
    as _i15;
import 'package:ecom_app/core/DI/injectable_config.dart' as _i24;
import 'package:ecom_app/core/domain/repostitory/core_repository.dart' as _i14;
import 'package:ecom_app/core/domain/use_cases/dislike_usecase.dart' as _i16;
import 'package:ecom_app/core/domain/use_cases/like_usecase.dart' as _i17;
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart' as _i22;
import 'package:ecom_app/src/features/auth/data/data_source/supabase_datasource.dart'
    as _i5;
import 'package:ecom_app/src/features/auth/data/repositories/supabase_auth_repository.dart'
    as _i13;
import 'package:ecom_app/src/features/auth/domain/repositories/auth_repository.dart'
    as _i12;
import 'package:ecom_app/src/features/auth/domain/usecases/email_verif_usecase.dart'
    as _i18;
import 'package:ecom_app/src/features/auth/domain/usecases/signin_usecase.dart'
    as _i19;
import 'package:ecom_app/src/features/auth/domain/usecases/signup_usecase.dart'
    as _i20;
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_bloc.dart'
    as _i23;
import 'package:ecom_app/src/features/home/data/data_source/supabase_datasource.dart'
    as _i6;
import 'package:ecom_app/src/features/home/data/repository/supabase_repository_impl.dart'
    as _i8;
import 'package:ecom_app/src/features/home/domain/repository/home_repository.dart'
    as _i7;
import 'package:ecom_app/src/features/home/domain/usecases/get_all_categories_usecase.dart'
    as _i9;
import 'package:ecom_app/src/features/home/domain/usecases/get_all_products_by_category.dart'
    as _i10;
import 'package:ecom_app/src/features/home/domain/usecases/get_new_arrivals_usecase.dart'
    as _i11;
import 'package:ecom_app/src/features/home/presentation/bloc/home_bloc.dart'
    as _i21;
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
    gh.lazySingleton<_i4.SupabaseCoreRepository>(
        () => _i4.SupabaseCoreRepository(supabase: gh<_i3.SupabaseClient>()));
    gh.lazySingleton<_i5.SupabaseAuthDataSource>(
        () => _i5.SupabaseAuthDataSource(supabase: gh<_i3.SupabaseClient>()));
    gh.lazySingleton<_i6.SupabaseHomeDataSource>(
        () => _i6.SupabaseHomeDataSource(supabase: gh<_i3.SupabaseClient>()));
    gh.lazySingleton<_i7.HomeRepository>(() => _i8.SupabaseRepositoryImpl(
        dataSource: gh<_i6.SupabaseHomeDataSource>()));
    gh.factory<_i9.GetAllCategoriesUsecase>(() =>
        _i9.GetAllCategoriesUsecase(homeRepository: gh<_i7.HomeRepository>()));
    gh.factory<_i10.GetAllProductsByCategoryUseCase>(() =>
        _i10.GetAllProductsByCategoryUseCase(
            homeRepository: gh<_i7.HomeRepository>()));
    gh.factory<_i11.GetNewArrivalsUsecase>(() =>
        _i11.GetNewArrivalsUsecase(homeRepository: gh<_i7.HomeRepository>()));
    gh.lazySingleton<_i12.AuthRepository>(() => _i13.SupabaseAuthRepositoryImpl(
        supabaseds: gh<_i5.SupabaseAuthDataSource>()));
    gh.lazySingleton<_i14.CoreRepository>(() =>
        _i15.SupabaseCoreRepostitoryImpl(
            supabaseCoreRepository: gh<_i4.SupabaseCoreRepository>()));
    gh.factory<_i16.DislikeUsecase>(
        () => _i16.DislikeUsecase(coreRepository: gh<_i14.CoreRepository>()));
    gh.factory<_i17.LikeUseCase>(
        () => _i17.LikeUseCase(coreRepository: gh<_i14.CoreRepository>()));
    gh.factory<_i18.EmailVerifUsecase>(() =>
        _i18.EmailVerifUsecase(authRepository: gh<_i12.AuthRepository>()));
    gh.factory<_i19.SigninUsecase>(
        () => _i19.SigninUsecase(authRepository: gh<_i12.AuthRepository>()));
    gh.factory<_i20.SignupUsecase>(
        () => _i20.SignupUsecase(authRepository: gh<_i12.AuthRepository>()));
    gh.factory<_i21.HomeBloc>(() => _i21.HomeBloc(
          productsByCategoryUseCase: gh<_i10.GetAllProductsByCategoryUseCase>(),
          allCategoriesUsecase: gh<_i9.GetAllCategoriesUsecase>(),
          arrivalsUsecase: gh<_i11.GetNewArrivalsUsecase>(),
        ));
    gh.factory<_i22.CoreBloc>(() => _i22.CoreBloc(
          likeUseCase: gh<_i17.LikeUseCase>(),
          dislikeUsecase: gh<_i16.DislikeUsecase>(),
        ));
    gh.factory<_i23.AuthBloc>(() => _i23.AuthBloc(
          signinUsecase: gh<_i19.SigninUsecase>(),
          signupUsecase: gh<_i20.SignupUsecase>(),
          emailVerifUsecase: gh<_i18.EmailVerifUsecase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i24.RegisterModule {}
