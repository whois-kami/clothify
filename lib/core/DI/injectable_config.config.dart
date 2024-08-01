// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecom_app/core/data/data_source/shared_preferences_source.dart'
    as _i5;
import 'package:ecom_app/core/data/data_source/supabase_source.dart' as _i6;
import 'package:ecom_app/core/data/repository/supabase_repostitory_impl.dart'
    as _i12;
import 'package:ecom_app/core/DI/injectable_config.dart' as _i48;
import 'package:ecom_app/core/domain/repostitory/core_repository.dart' as _i11;
import 'package:ecom_app/core/domain/use_cases/decrement_count_product_usecase.dart'
    as _i15;
import 'package:ecom_app/core/domain/use_cases/dislike_usecase.dart' as _i16;
import 'package:ecom_app/core/domain/use_cases/get_all_shoping_cart_usecase.dart'
    as _i17;
import 'package:ecom_app/core/domain/use_cases/get_count_product_usecase.dart'
    as _i22;
import 'package:ecom_app/core/domain/use_cases/get_profile_usecase.dart'
    as _i18;
import 'package:ecom_app/core/domain/use_cases/increment_count_product_usecase.dart'
    as _i19;
import 'package:ecom_app/core/domain/use_cases/like_usecase.dart' as _i20;
import 'package:ecom_app/core/domain/use_cases/sync_with_db_usecase.dart'
    as _i21;
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart' as _i39;
import 'package:ecom_app/src/features/auth/data/data_source/supabase_datasource.dart'
    as _i13;
import 'package:ecom_app/src/features/auth/data/repositories/supabase_auth_repository.dart'
    as _i36;
import 'package:ecom_app/src/features/auth/domain/repositories/auth_repository.dart'
    as _i35;
import 'package:ecom_app/src/features/auth/domain/usecases/email_verif_usecase.dart'
    as _i40;
import 'package:ecom_app/src/features/auth/domain/usecases/signin_usecase.dart'
    as _i41;
import 'package:ecom_app/src/features/auth/domain/usecases/signup_usecase.dart'
    as _i42;
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_bloc.dart'
    as _i47;
import 'package:ecom_app/src/features/favorites/data/data_source/supabase_datasource.dart'
    as _i7;
import 'package:ecom_app/src/features/favorites/data/repository/supabase_repository_impl.dart'
    as _i10;
import 'package:ecom_app/src/features/favorites/domain/repository/favorite_repository.dart'
    as _i9;
import 'package:ecom_app/src/features/favorites/domain/use_case/get_favorite_products_usecase.dart'
    as _i23;
import 'package:ecom_app/src/features/favorites/domain/use_case/get_filtered_items_usecase.dart'
    as _i24;
import 'package:ecom_app/src/features/favorites/presentation/bloc/favorite_bloc.dart'
    as _i25;
import 'package:ecom_app/src/features/home/data/data_source/supabase_datasource.dart'
    as _i8;
import 'package:ecom_app/src/features/home/data/repository/supabase_repository_impl.dart'
    as _i27;
import 'package:ecom_app/src/features/home/domain/repository/home_repository.dart'
    as _i26;
import 'package:ecom_app/src/features/home/domain/usecases/add_last_search_usecase.dart'
    as _i28;
import 'package:ecom_app/src/features/home/domain/usecases/get_all_categories_usecase.dart'
    as _i29;
import 'package:ecom_app/src/features/home/domain/usecases/get_all_products_by_category.dart'
    as _i30;
import 'package:ecom_app/src/features/home/domain/usecases/get_filtered_items_usecase.dart'
    as _i31;
import 'package:ecom_app/src/features/home/domain/usecases/get_last_search_usecase.dart'
    as _i32;
import 'package:ecom_app/src/features/home/domain/usecases/get_new_arrivals_usecase.dart'
    as _i33;
import 'package:ecom_app/src/features/home/domain/usecases/get_search_items_usecase.dart'
    as _i34;
import 'package:ecom_app/src/features/home/presentation/bloc/home_bloc.dart'
    as _i45;
import 'package:ecom_app/src/features/settings/data/data_source/supabase_datasource.dart'
    as _i14;
import 'package:ecom_app/src/features/settings/data/repository/supabase_repository_impl.dart'
    as _i38;
import 'package:ecom_app/src/features/settings/domain/repository/settings_repository.dart'
    as _i37;
import 'package:ecom_app/src/features/settings/domain/use_cases/change_password_usecase.dart'
    as _i43;
import 'package:ecom_app/src/features/settings/domain/use_cases/update_profile_photo_usecase.dart'
    as _i44;
import 'package:ecom_app/src/features/settings/presentation/bloc/settings_bloc.dart'
    as _i46;
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
    gh.lazySingleton<_i5.SharedPreferencesSource>(() =>
        _i5.SharedPreferencesSource(preferences: gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i6.SupabaseCoreRepository>(
        () => _i6.SupabaseCoreRepository(
              supabase: gh<_i4.SupabaseClient>(),
              preferences: gh<_i3.SharedPreferences>(),
            ));
    gh.lazySingleton<_i7.SupabaseFavoritesDatasource>(
        () => _i7.SupabaseFavoritesDatasource(
              supabase: gh<_i4.SupabaseClient>(),
              preferences: gh<_i3.SharedPreferences>(),
            ));
    gh.lazySingleton<_i8.SupabaseHomeDataSource>(
        () => _i8.SupabaseHomeDataSource(
              supabase: gh<_i4.SupabaseClient>(),
              preferences: gh<_i3.SharedPreferences>(),
            ));
    gh.lazySingleton<_i9.FavoriteRepository>(() =>
        _i10.SupabaseFavoritesRepositoryImpl(
            supabaseFavoritesDatasource:
                gh<_i7.SupabaseFavoritesDatasource>()));
    gh.lazySingleton<_i11.CoreRepository>(() =>
        _i12.SupabaseCoreRepostitoryImpl(
            supabaseCoreRepository: gh<_i6.SupabaseCoreRepository>()));
    gh.lazySingleton<_i13.SupabaseAuthDataSource>(
        () => _i13.SupabaseAuthDataSource(supabase: gh<_i4.SupabaseClient>()));
    gh.lazySingleton<_i14.SupabaseSettingsDatasource>(() =>
        _i14.SupabaseSettingsDatasource(supabase: gh<_i4.SupabaseClient>()));
    gh.factory<_i15.DecrementCountProductUsecase>(() =>
        _i15.DecrementCountProductUsecase(
            coreRepository: gh<_i11.CoreRepository>()));
    gh.factory<_i16.DislikeUsecase>(
        () => _i16.DislikeUsecase(coreRepository: gh<_i11.CoreRepository>()));
    gh.factory<_i17.GetAllShopingCartUsecase>(() =>
        _i17.GetAllShopingCartUsecase(
            coreRepository: gh<_i11.CoreRepository>()));
    gh.factory<_i18.GetProfileUsecase>(() =>
        _i18.GetProfileUsecase(coreRepository: gh<_i11.CoreRepository>()));
    gh.factory<_i19.IncrementCountProductUsecase>(() =>
        _i19.IncrementCountProductUsecase(
            coreRepository: gh<_i11.CoreRepository>()));
    gh.factory<_i20.LikeUseCase>(
        () => _i20.LikeUseCase(coreRepository: gh<_i11.CoreRepository>()));
    gh.factory<_i21.SyncWithDbUsecase>(() =>
        _i21.SyncWithDbUsecase(coreRepository: gh<_i11.CoreRepository>()));
    gh.factory<_i22.GetCountProductUsecase>(() =>
        _i22.GetCountProductUsecase(coreRepository: gh<_i11.CoreRepository>()));
    gh.factory<_i23.GetFavoriteProductsUsecase>(() =>
        _i23.GetFavoriteProductsUsecase(
            homeRepository: gh<_i9.FavoriteRepository>()));
    gh.factory<_i24.GetFilteredItemsUsecase>(() => _i24.GetFilteredItemsUsecase(
        homeRepository: gh<_i9.FavoriteRepository>()));
    gh.factory<_i25.FavoriteBloc>(() => _i25.FavoriteBloc(
          getFilteredItemsUsecase: gh<_i24.GetFilteredItemsUsecase>(),
          favoriteRepository: gh<_i23.GetFavoriteProductsUsecase>(),
        ));
    gh.lazySingleton<_i26.HomeRepository>(() => _i27.SupabaseRepositoryImpl(
        dataSource: gh<_i8.SupabaseHomeDataSource>()));
    gh.factory<_i28.AddLastSearchUsecase>(() =>
        _i28.AddLastSearchUsecase(homeRepository: gh<_i26.HomeRepository>()));
    gh.factory<_i29.GetAllCategoriesUsecase>(() => _i29.GetAllCategoriesUsecase(
        homeRepository: gh<_i26.HomeRepository>()));
    gh.factory<_i30.GetAllProductsByCategoryUseCase>(() =>
        _i30.GetAllProductsByCategoryUseCase(
            homeRepository: gh<_i26.HomeRepository>()));
    gh.factory<_i31.GetFilteredItemsUsecase>(() => _i31.GetFilteredItemsUsecase(
        homeRepository: gh<_i26.HomeRepository>()));
    gh.factory<_i32.GetLastSearchUsecase>(() =>
        _i32.GetLastSearchUsecase(homeRepository: gh<_i26.HomeRepository>()));
    gh.factory<_i33.GetNewArrivalsUsecase>(() =>
        _i33.GetNewArrivalsUsecase(homeRepository: gh<_i26.HomeRepository>()));
    gh.factory<_i34.GetSearchItemsUsecase>(() =>
        _i34.GetSearchItemsUsecase(homeRepository: gh<_i26.HomeRepository>()));
    gh.lazySingleton<_i35.AuthRepository>(() => _i36.SupabaseAuthRepositoryImpl(
        supabaseds: gh<_i13.SupabaseAuthDataSource>()));
    gh.lazySingleton<_i37.SettingsRepository>(() => _i38.SupabaseRepositoryImpl(
        dataSource: gh<_i14.SupabaseSettingsDatasource>()));
    gh.factory<_i39.CoreBloc>(() => _i39.CoreBloc(
          getAllShopingCartUsecase: gh<_i17.GetAllShopingCartUsecase>(),
          incrementCountProductUsecase: gh<_i19.IncrementCountProductUsecase>(),
          decrementCountProductUsecase: gh<_i15.DecrementCountProductUsecase>(),
          likeUseCase: gh<_i20.LikeUseCase>(),
          dislikeUsecase: gh<_i16.DislikeUsecase>(),
          syncWithDbUsecase: gh<_i21.SyncWithDbUsecase>(),
          getProfileUsecase: gh<_i18.GetProfileUsecase>(),
          addLastSearchUsecase: gh<_i28.AddLastSearchUsecase>(),
          getLastSearchUsecase: gh<_i32.GetLastSearchUsecase>(),
          getSearchItemsUsecase: gh<_i34.GetSearchItemsUsecase>(),
          getCountProductUsecase: gh<_i22.GetCountProductUsecase>(),
        ));
    gh.factory<_i40.EmailVerifUsecase>(() =>
        _i40.EmailVerifUsecase(authRepository: gh<_i35.AuthRepository>()));
    gh.factory<_i41.SigninUsecase>(
        () => _i41.SigninUsecase(authRepository: gh<_i35.AuthRepository>()));
    gh.factory<_i42.SignupUsecase>(
        () => _i42.SignupUsecase(authRepository: gh<_i35.AuthRepository>()));
    gh.factory<_i43.ChangePasswordUsecase>(() => _i43.ChangePasswordUsecase(
        settingsRepository: gh<_i37.SettingsRepository>()));
    gh.factory<_i44.UpdateProfilePhotoUsecase>(() =>
        _i44.UpdateProfilePhotoUsecase(
            settingsRepository: gh<_i37.SettingsRepository>()));
    gh.factory<_i45.HomeBloc>(() => _i45.HomeBloc(
          gh<_i31.GetFilteredItemsUsecase>(),
          productsByCategoryUseCase: gh<_i30.GetAllProductsByCategoryUseCase>(),
          allCategoriesUsecase: gh<_i29.GetAllCategoriesUsecase>(),
          arrivalsUsecase: gh<_i33.GetNewArrivalsUsecase>(),
          getLastSearchUsecase: gh<_i32.GetLastSearchUsecase>(),
          addLastSearchUsecase: gh<_i28.AddLastSearchUsecase>(),
          getSearchItemsUsecase: gh<_i34.GetSearchItemsUsecase>(),
        ));
    gh.factory<_i46.SettingsBloc>(() => _i46.SettingsBloc(
          updateProfilePhotoUsecase: gh<_i44.UpdateProfilePhotoUsecase>(),
          changePasswordUsecase: gh<_i43.ChangePasswordUsecase>(),
        ));
    gh.factory<_i47.AuthBloc>(() => _i47.AuthBloc(
          signinUsecase: gh<_i41.SigninUsecase>(),
          signupUsecase: gh<_i42.SignupUsecase>(),
          emailVerifUsecase: gh<_i40.EmailVerifUsecase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i48.InjectionModule {}
