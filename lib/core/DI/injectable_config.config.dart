// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecom_app/core/data/data_source/supabase_repository.dart' as _i5;
import 'package:ecom_app/core/data/repository/supabase_repostitory_impl.dart'
    as _i11;
import 'package:ecom_app/core/DI/injectable_config.dart' as _i41;
import 'package:ecom_app/core/domain/repostitory/core_repository.dart' as _i10;
import 'package:ecom_app/core/domain/use_cases/dislike_usecase.dart' as _i14;
import 'package:ecom_app/core/domain/use_cases/get_profile_usecase.dart'
    as _i15;
import 'package:ecom_app/core/domain/use_cases/like_usecase.dart' as _i16;
import 'package:ecom_app/core/domain/use_cases/sync_with_db_usecase.dart'
    as _i17;
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart' as _i37;
import 'package:ecom_app/src/features/auth/data/data_source/supabase_datasource.dart'
    as _i12;
import 'package:ecom_app/src/features/auth/data/repositories/supabase_auth_repository.dart'
    as _i28;
import 'package:ecom_app/src/features/auth/domain/repositories/auth_repository.dart'
    as _i27;
import 'package:ecom_app/src/features/auth/domain/usecases/email_verif_usecase.dart'
    as _i32;
import 'package:ecom_app/src/features/auth/domain/usecases/signin_usecase.dart'
    as _i33;
import 'package:ecom_app/src/features/auth/domain/usecases/signup_usecase.dart'
    as _i34;
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_bloc.dart'
    as _i40;
import 'package:ecom_app/src/features/favorites/data/data_source/supabase_datasource.dart'
    as _i6;
import 'package:ecom_app/src/features/favorites/data/repository/supabase_repository_impl.dart'
    as _i9;
import 'package:ecom_app/src/features/favorites/domain/repository/favorite_repository.dart'
    as _i8;
import 'package:ecom_app/src/features/favorites/domain/use_case/get_favorite_products_usecase.dart'
    as _i18;
import 'package:ecom_app/src/features/favorites/presentation/bloc/favorite_bloc.dart'
    as _i31;
import 'package:ecom_app/src/features/home/data/data_source/supabase_datasource.dart'
    as _i7;
import 'package:ecom_app/src/features/home/data/repository/supabase_repository_impl.dart'
    as _i20;
import 'package:ecom_app/src/features/home/domain/repository/home_repository.dart'
    as _i19;
import 'package:ecom_app/src/features/home/domain/usecases/add_last_search_usecase.dart'
    as _i21;
import 'package:ecom_app/src/features/home/domain/usecases/get_all_categories_usecase.dart'
    as _i22;
import 'package:ecom_app/src/features/home/domain/usecases/get_all_products_by_category.dart'
    as _i23;
import 'package:ecom_app/src/features/home/domain/usecases/get_last_search_usecase.dart'
    as _i24;
import 'package:ecom_app/src/features/home/domain/usecases/get_new_arrivals_usecase.dart'
    as _i25;
import 'package:ecom_app/src/features/home/domain/usecases/get_search_items_usecase.dart'
    as _i26;
import 'package:ecom_app/src/features/home/presentation/bloc/home_bloc.dart'
    as _i38;
import 'package:ecom_app/src/features/settings/data/data_source/supabase_datasource.dart'
    as _i13;
import 'package:ecom_app/src/features/settings/data/repository/supabase_repository_impl.dart'
    as _i30;
import 'package:ecom_app/src/features/settings/domain/repository/settings_repository.dart'
    as _i29;
import 'package:ecom_app/src/features/settings/domain/use_cases/change_password_usecase.dart'
    as _i35;
import 'package:ecom_app/src/features/settings/domain/use_cases/update_profile_photo_usecase.dart'
    as _i36;
import 'package:ecom_app/src/features/settings/presentation/bloc/settings_bloc.dart'
    as _i39;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;
import 'package:supabase_flutter/supabase_flutter.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => injectionModule.getPrefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i4.SupabaseClient>(() => injectionModule.supabaseClient);
    gh.lazySingleton<_i5.SupabaseCoreRepository>(
        () => _i5.SupabaseCoreRepository(
              supabase: gh<_i4.SupabaseClient>(),
              preferences: gh<_i3.SharedPreferences>(),
            ));
    gh.lazySingleton<_i6.SupabaseFavoritesDatasource>(
        () => _i6.SupabaseFavoritesDatasource(
              supabase: gh<_i4.SupabaseClient>(),
              preferences: gh<_i3.SharedPreferences>(),
            ));
    gh.lazySingleton<_i7.SupabaseHomeDataSource>(
        () => _i7.SupabaseHomeDataSource(
              supabase: gh<_i4.SupabaseClient>(),
              preferences: gh<_i3.SharedPreferences>(),
            ));
    gh.lazySingleton<_i8.FavoriteRepository>(() =>
        _i9.SupabaseFavoritesRepositoryImpl(
            supabaseFavoritesDatasource:
                gh<_i6.SupabaseFavoritesDatasource>()));
    gh.lazySingleton<_i10.CoreRepository>(() =>
        _i11.SupabaseCoreRepostitoryImpl(
            supabaseCoreRepository: gh<_i5.SupabaseCoreRepository>()));
    gh.lazySingleton<_i12.SupabaseAuthDataSource>(
        () => _i12.SupabaseAuthDataSource(supabase: gh<_i4.SupabaseClient>()));
    gh.lazySingleton<_i13.SupabaseSettingsDatasource>(() =>
        _i13.SupabaseSettingsDatasource(supabase: gh<_i4.SupabaseClient>()));
    gh.factory<_i14.DislikeUsecase>(
        () => _i14.DislikeUsecase(coreRepository: gh<_i10.CoreRepository>()));
    gh.factory<_i15.GetProfileUsecase>(() =>
        _i15.GetProfileUsecase(coreRepository: gh<_i10.CoreRepository>()));
    gh.factory<_i16.LikeUseCase>(
        () => _i16.LikeUseCase(coreRepository: gh<_i10.CoreRepository>()));
    gh.factory<_i17.SyncWithDbUsecase>(() =>
        _i17.SyncWithDbUsecase(coreRepository: gh<_i10.CoreRepository>()));
    gh.factory<_i18.GetFavoriteProductsUsecase>(() =>
        _i18.GetFavoriteProductsUsecase(
            homeRepository: gh<_i8.FavoriteRepository>()));
    gh.lazySingleton<_i19.HomeRepository>(() => _i20.SupabaseRepositoryImpl(
        dataSource: gh<_i7.SupabaseHomeDataSource>()));
    gh.factory<_i21.AddLastSearchUsecase>(() =>
        _i21.AddLastSearchUsecase(homeRepository: gh<_i19.HomeRepository>()));
    gh.factory<_i22.GetAllCategoriesUsecase>(() => _i22.GetAllCategoriesUsecase(
        homeRepository: gh<_i19.HomeRepository>()));
    gh.factory<_i23.GetAllProductsByCategoryUseCase>(() =>
        _i23.GetAllProductsByCategoryUseCase(
            homeRepository: gh<_i19.HomeRepository>()));
    gh.factory<_i24.GetLastSearchUsecase>(() =>
        _i24.GetLastSearchUsecase(homeRepository: gh<_i19.HomeRepository>()));
    gh.factory<_i25.GetNewArrivalsUsecase>(() =>
        _i25.GetNewArrivalsUsecase(homeRepository: gh<_i19.HomeRepository>()));
    gh.factory<_i26.GetSearchItemsUsecase>(() =>
        _i26.GetSearchItemsUsecase(homeRepository: gh<_i19.HomeRepository>()));
    gh.lazySingleton<_i27.AuthRepository>(() => _i28.SupabaseAuthRepositoryImpl(
        supabaseds: gh<_i12.SupabaseAuthDataSource>()));
    gh.lazySingleton<_i29.SettingsRepository>(() => _i30.SupabaseRepositoryImpl(
        dataSource: gh<_i13.SupabaseSettingsDatasource>()));
    gh.factory<_i31.FavoriteBloc>(() => _i31.FavoriteBloc(
        favoriteRepository: gh<_i18.GetFavoriteProductsUsecase>()));
    gh.factory<_i32.EmailVerifUsecase>(() =>
        _i32.EmailVerifUsecase(authRepository: gh<_i27.AuthRepository>()));
    gh.factory<_i33.SigninUsecase>(
        () => _i33.SigninUsecase(authRepository: gh<_i27.AuthRepository>()));
    gh.factory<_i34.SignupUsecase>(
        () => _i34.SignupUsecase(authRepository: gh<_i27.AuthRepository>()));
    gh.factory<_i35.ChangePasswordUsecase>(() => _i35.ChangePasswordUsecase(
        settingsRepository: gh<_i29.SettingsRepository>()));
    gh.factory<_i36.UpdateProfilePhotoUsecase>(() =>
        _i36.UpdateProfilePhotoUsecase(
            settingsRepository: gh<_i29.SettingsRepository>()));
    gh.factory<_i37.CoreBloc>(() => _i37.CoreBloc(
          likeUseCase: gh<_i16.LikeUseCase>(),
          dislikeUsecase: gh<_i14.DislikeUsecase>(),
          syncWithDbUsecase: gh<_i17.SyncWithDbUsecase>(),
          getProfileUsecase: gh<_i15.GetProfileUsecase>(),
          addLastSearchUsecase: gh<_i21.AddLastSearchUsecase>(),
          getLastSearchUsecase: gh<_i24.GetLastSearchUsecase>(),
          getSearchItemsUsecase: gh<_i26.GetSearchItemsUsecase>(),
        ));
    gh.factory<_i38.HomeBloc>(() => _i38.HomeBloc(
          productsByCategoryUseCase: gh<_i23.GetAllProductsByCategoryUseCase>(),
          allCategoriesUsecase: gh<_i22.GetAllCategoriesUsecase>(),
          arrivalsUsecase: gh<_i25.GetNewArrivalsUsecase>(),
          getLastSearchUsecase: gh<_i24.GetLastSearchUsecase>(),
          addLastSearchUsecase: gh<_i21.AddLastSearchUsecase>(),
          getSearchItemsUsecase: gh<_i26.GetSearchItemsUsecase>(),
        ));
    gh.factory<_i39.SettingsBloc>(() => _i39.SettingsBloc(
          updateProfilePhotoUsecase: gh<_i36.UpdateProfilePhotoUsecase>(),
          changePasswordUsecase: gh<_i35.ChangePasswordUsecase>(),
        ));
    gh.factory<_i40.AuthBloc>(() => _i40.AuthBloc(
          signinUsecase: gh<_i33.SigninUsecase>(),
          signupUsecase: gh<_i34.SignupUsecase>(),
          emailVerifUsecase: gh<_i32.EmailVerifUsecase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i41.InjectionModule {}
