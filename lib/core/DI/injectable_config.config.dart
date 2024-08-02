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
    as _i15;
import 'package:ecom_app/core/DI/injectable_config.dart' as _i53;
import 'package:ecom_app/core/domain/repostitory/core_repository.dart' as _i14;
import 'package:ecom_app/core/domain/use_cases/decrement_count_product_usecase.dart'
    as _i18;
import 'package:ecom_app/core/domain/use_cases/dislike_usecase.dart' as _i19;
import 'package:ecom_app/core/domain/use_cases/get_all_shoping_cart_usecase.dart'
    as _i20;
import 'package:ecom_app/core/domain/use_cases/get_count_product_usecase.dart'
    as _i25;
import 'package:ecom_app/core/domain/use_cases/get_profile_usecase.dart'
    as _i21;
import 'package:ecom_app/core/domain/use_cases/increment_count_product_usecase.dart'
    as _i22;
import 'package:ecom_app/core/domain/use_cases/like_usecase.dart' as _i23;
import 'package:ecom_app/core/domain/use_cases/sync_with_db_usecase.dart'
    as _i24;
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart' as _i43;
import 'package:ecom_app/src/features/auth/data/data_source/supabase_datasource.dart'
    as _i16;
import 'package:ecom_app/src/features/auth/data/repositories/supabase_auth_repository.dart'
    as _i40;
import 'package:ecom_app/src/features/auth/domain/repositories/auth_repository.dart'
    as _i39;
import 'package:ecom_app/src/features/auth/domain/usecases/email_verif_usecase.dart'
    as _i44;
import 'package:ecom_app/src/features/auth/domain/usecases/signin_usecase.dart'
    as _i45;
import 'package:ecom_app/src/features/auth/domain/usecases/signup_usecase.dart'
    as _i46;
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_bloc.dart'
    as _i52;
import 'package:ecom_app/src/features/cart/data/data_source/supabase_datasource.dart'
    as _i9;
import 'package:ecom_app/src/features/cart/data/repository/cart_repository_impl.dart'
    as _i13;
import 'package:ecom_app/src/features/cart/domain/repository/cart_repository.dart'
    as _i12;
import 'package:ecom_app/src/features/cart/domain/usecases/get_all_cart_products_usecase.dart'
    as _i31;
import 'package:ecom_app/src/features/cart/presentation/bloc/cart_bloc.dart'
    as _i49;
import 'package:ecom_app/src/features/favorites/data/data_source/supabase_datasource.dart'
    as _i7;
import 'package:ecom_app/src/features/favorites/data/repository/supabase_repository_impl.dart'
    as _i11;
import 'package:ecom_app/src/features/favorites/domain/repository/favorite_repository.dart'
    as _i10;
import 'package:ecom_app/src/features/favorites/domain/use_case/get_favorite_products_usecase.dart'
    as _i26;
import 'package:ecom_app/src/features/favorites/domain/use_case/get_filtered_items_usecase.dart'
    as _i27;
import 'package:ecom_app/src/features/favorites/presentation/bloc/favorite_bloc.dart'
    as _i28;
import 'package:ecom_app/src/features/home/data/data_source/supabase_datasource.dart'
    as _i8;
import 'package:ecom_app/src/features/home/data/repository/supabase_repository_impl.dart'
    as _i30;
import 'package:ecom_app/src/features/home/domain/repository/home_repository.dart'
    as _i29;
import 'package:ecom_app/src/features/home/domain/usecases/add_last_search_usecase.dart'
    as _i32;
import 'package:ecom_app/src/features/home/domain/usecases/get_all_categories_usecase.dart'
    as _i33;
import 'package:ecom_app/src/features/home/domain/usecases/get_all_products_by_category.dart'
    as _i34;
import 'package:ecom_app/src/features/home/domain/usecases/get_filtered_items_usecase.dart'
    as _i35;
import 'package:ecom_app/src/features/home/domain/usecases/get_last_search_usecase.dart'
    as _i36;
import 'package:ecom_app/src/features/home/domain/usecases/get_new_arrivals_usecase.dart'
    as _i37;
import 'package:ecom_app/src/features/home/domain/usecases/get_search_items_usecase.dart'
    as _i38;
import 'package:ecom_app/src/features/home/presentation/bloc/home_bloc.dart'
    as _i50;
import 'package:ecom_app/src/features/settings/data/data_source/supabase_datasource.dart'
    as _i17;
import 'package:ecom_app/src/features/settings/data/repository/supabase_repository_impl.dart'
    as _i42;
import 'package:ecom_app/src/features/settings/domain/repository/settings_repository.dart'
    as _i41;
import 'package:ecom_app/src/features/settings/domain/use_cases/change_password_usecase.dart'
    as _i47;
import 'package:ecom_app/src/features/settings/domain/use_cases/update_profile_photo_usecase.dart'
    as _i48;
import 'package:ecom_app/src/features/settings/presentation/bloc/settings_bloc.dart'
    as _i51;
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
    gh.lazySingleton<_i9.SupabaseCartDatasource>(
        () => _i9.SupabaseCartDatasource(
              supabase: gh<_i4.SupabaseClient>(),
              preferences: gh<_i3.SharedPreferences>(),
            ));
    gh.lazySingleton<_i10.FavoriteRepository>(() =>
        _i11.SupabaseFavoritesRepositoryImpl(
            supabaseFavoritesDatasource:
                gh<_i7.SupabaseFavoritesDatasource>()));
    gh.lazySingleton<_i12.CartRepository>(() => _i13.CartRepositoryImpl(
        supabaseCartDatasource: gh<_i9.SupabaseCartDatasource>()));
    gh.lazySingleton<_i14.CoreRepository>(() =>
        _i15.SupabaseCoreRepostitoryImpl(
            supabaseCoreRepository: gh<_i6.SupabaseCoreRepository>()));
    gh.lazySingleton<_i16.SupabaseAuthDataSource>(
        () => _i16.SupabaseAuthDataSource(supabase: gh<_i4.SupabaseClient>()));
    gh.lazySingleton<_i17.SupabaseSettingsDatasource>(() =>
        _i17.SupabaseSettingsDatasource(supabase: gh<_i4.SupabaseClient>()));
    gh.factory<_i18.DecrementCountProductUsecase>(() =>
        _i18.DecrementCountProductUsecase(
            coreRepository: gh<_i14.CoreRepository>()));
    gh.factory<_i19.DislikeUsecase>(
        () => _i19.DislikeUsecase(coreRepository: gh<_i14.CoreRepository>()));
    gh.factory<_i20.GetAllShopingCartUsecase>(() =>
        _i20.GetAllShopingCartUsecase(
            coreRepository: gh<_i14.CoreRepository>()));
    gh.factory<_i21.GetProfileUsecase>(() =>
        _i21.GetProfileUsecase(coreRepository: gh<_i14.CoreRepository>()));
    gh.factory<_i22.IncrementCountProductUsecase>(() =>
        _i22.IncrementCountProductUsecase(
            coreRepository: gh<_i14.CoreRepository>()));
    gh.factory<_i23.LikeUseCase>(
        () => _i23.LikeUseCase(coreRepository: gh<_i14.CoreRepository>()));
    gh.factory<_i24.SyncWithDbUsecase>(() =>
        _i24.SyncWithDbUsecase(coreRepository: gh<_i14.CoreRepository>()));
    gh.factory<_i25.GetCountProductUsecase>(() =>
        _i25.GetCountProductUsecase(coreRepository: gh<_i14.CoreRepository>()));
    gh.factory<_i26.GetFavoriteProductsUsecase>(() =>
        _i26.GetFavoriteProductsUsecase(
            homeRepository: gh<_i10.FavoriteRepository>()));
    gh.factory<_i27.GetFilteredItemsUsecase>(() => _i27.GetFilteredItemsUsecase(
        homeRepository: gh<_i10.FavoriteRepository>()));
    gh.factory<_i28.FavoriteBloc>(() => _i28.FavoriteBloc(
          getFilteredItemsUsecase: gh<_i27.GetFilteredItemsUsecase>(),
          favoriteRepository: gh<_i26.GetFavoriteProductsUsecase>(),
        ));
    gh.lazySingleton<_i29.HomeRepository>(() => _i30.SupabaseRepositoryImpl(
        dataSource: gh<_i8.SupabaseHomeDataSource>()));
    gh.factory<_i31.GetAllCartProductsUsecase>(() =>
        _i31.GetAllCartProductsUsecase(
            cartRepository: gh<_i12.CartRepository>()));
    gh.factory<_i32.AddLastSearchUsecase>(() =>
        _i32.AddLastSearchUsecase(homeRepository: gh<_i29.HomeRepository>()));
    gh.factory<_i33.GetAllCategoriesUsecase>(() => _i33.GetAllCategoriesUsecase(
        homeRepository: gh<_i29.HomeRepository>()));
    gh.factory<_i34.GetAllProductsByCategoryUseCase>(() =>
        _i34.GetAllProductsByCategoryUseCase(
            homeRepository: gh<_i29.HomeRepository>()));
    gh.factory<_i35.GetFilteredItemsUsecase>(() => _i35.GetFilteredItemsUsecase(
        homeRepository: gh<_i29.HomeRepository>()));
    gh.factory<_i36.GetLastSearchUsecase>(() =>
        _i36.GetLastSearchUsecase(homeRepository: gh<_i29.HomeRepository>()));
    gh.factory<_i37.GetNewArrivalsUsecase>(() =>
        _i37.GetNewArrivalsUsecase(homeRepository: gh<_i29.HomeRepository>()));
    gh.factory<_i38.GetSearchItemsUsecase>(() =>
        _i38.GetSearchItemsUsecase(homeRepository: gh<_i29.HomeRepository>()));
    gh.lazySingleton<_i39.AuthRepository>(() => _i40.SupabaseAuthRepositoryImpl(
        supabaseds: gh<_i16.SupabaseAuthDataSource>()));
    gh.lazySingleton<_i41.SettingsRepository>(() => _i42.SupabaseRepositoryImpl(
        dataSource: gh<_i17.SupabaseSettingsDatasource>()));
    gh.factory<_i43.CoreBloc>(() => _i43.CoreBloc(
          getAllShopingCartUsecase: gh<_i20.GetAllShopingCartUsecase>(),
          incrementCountProductUsecase: gh<_i22.IncrementCountProductUsecase>(),
          decrementCountProductUsecase: gh<_i18.DecrementCountProductUsecase>(),
          likeUseCase: gh<_i23.LikeUseCase>(),
          dislikeUsecase: gh<_i19.DislikeUsecase>(),
          syncWithDbUsecase: gh<_i24.SyncWithDbUsecase>(),
          getProfileUsecase: gh<_i21.GetProfileUsecase>(),
          addLastSearchUsecase: gh<_i32.AddLastSearchUsecase>(),
          getLastSearchUsecase: gh<_i36.GetLastSearchUsecase>(),
          getSearchItemsUsecase: gh<_i38.GetSearchItemsUsecase>(),
          getCountProductUsecase: gh<_i25.GetCountProductUsecase>(),
        ));
    gh.factory<_i44.EmailVerifUsecase>(() =>
        _i44.EmailVerifUsecase(authRepository: gh<_i39.AuthRepository>()));
    gh.factory<_i45.SigninUsecase>(
        () => _i45.SigninUsecase(authRepository: gh<_i39.AuthRepository>()));
    gh.factory<_i46.SignupUsecase>(
        () => _i46.SignupUsecase(authRepository: gh<_i39.AuthRepository>()));
    gh.factory<_i47.ChangePasswordUsecase>(() => _i47.ChangePasswordUsecase(
        settingsRepository: gh<_i41.SettingsRepository>()));
    gh.factory<_i48.UpdateProfilePhotoUsecase>(() =>
        _i48.UpdateProfilePhotoUsecase(
            settingsRepository: gh<_i41.SettingsRepository>()));
    gh.factory<_i49.CartBloc>(() => _i49.CartBloc(
        getAllCartProductsUsecase: gh<_i31.GetAllCartProductsUsecase>()));
    gh.factory<_i50.HomeBloc>(() => _i50.HomeBloc(
          gh<_i35.GetFilteredItemsUsecase>(),
          productsByCategoryUseCase: gh<_i34.GetAllProductsByCategoryUseCase>(),
          allCategoriesUsecase: gh<_i33.GetAllCategoriesUsecase>(),
          arrivalsUsecase: gh<_i37.GetNewArrivalsUsecase>(),
          getLastSearchUsecase: gh<_i36.GetLastSearchUsecase>(),
          addLastSearchUsecase: gh<_i32.AddLastSearchUsecase>(),
          getSearchItemsUsecase: gh<_i38.GetSearchItemsUsecase>(),
        ));
    gh.factory<_i51.SettingsBloc>(() => _i51.SettingsBloc(
          updateProfilePhotoUsecase: gh<_i48.UpdateProfilePhotoUsecase>(),
          changePasswordUsecase: gh<_i47.ChangePasswordUsecase>(),
        ));
    gh.factory<_i52.AuthBloc>(() => _i52.AuthBloc(
          signinUsecase: gh<_i45.SigninUsecase>(),
          signupUsecase: gh<_i46.SignupUsecase>(),
          emailVerifUsecase: gh<_i44.EmailVerifUsecase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i53.InjectionModule {}
