// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecom_app/core/data/data_source/shared_preferences_source.dart'
    as _i6;
import 'package:ecom_app/core/data/data_source/supabase_source.dart' as _i7;
import 'package:ecom_app/core/data/repository/supabase_repostitory_impl.dart'
    as _i14;
import 'package:ecom_app/core/DI/injectable_config.dart' as _i57;
import 'package:ecom_app/core/domain/repostitory/core_repository.dart' as _i13;
import 'package:ecom_app/core/domain/use_cases/decrement_count_product_usecase.dart'
    as _i17;
import 'package:ecom_app/core/domain/use_cases/dislike_usecase.dart' as _i18;
import 'package:ecom_app/core/domain/use_cases/get_all_shoping_cart_usecase.dart'
    as _i19;
import 'package:ecom_app/core/domain/use_cases/get_count_product_usecase.dart'
    as _i20;
import 'package:ecom_app/core/domain/use_cases/get_profile_usecase.dart'
    as _i21;
import 'package:ecom_app/core/domain/use_cases/increment_count_product_usecase.dart'
    as _i22;
import 'package:ecom_app/core/domain/use_cases/like_usecase.dart' as _i23;
import 'package:ecom_app/core/domain/use_cases/sync_with_db_usecase.dart'
    as _i24;
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart' as _i48;
import 'package:ecom_app/core/services/encrypt_decrypt.dart' as _i12;
import 'package:ecom_app/src/features/auth/data/data_source/supabase_datasource.dart'
    as _i15;
import 'package:ecom_app/src/features/auth/data/repositories/supabase_auth_repository.dart'
    as _i44;
import 'package:ecom_app/src/features/auth/domain/repositories/auth_repository.dart'
    as _i43;
import 'package:ecom_app/src/features/auth/domain/usecases/email_verif_usecase.dart'
    as _i49;
import 'package:ecom_app/src/features/auth/domain/usecases/signin_usecase.dart'
    as _i50;
import 'package:ecom_app/src/features/auth/domain/usecases/signup_usecase.dart'
    as _i51;
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_bloc.dart'
    as _i56;
import 'package:ecom_app/src/features/cart/data/data_source/supabase_datasource.dart'
    as _i27;
import 'package:ecom_app/src/features/cart/data/repository/cart_repository_impl.dart'
    as _i29;
import 'package:ecom_app/src/features/cart/domain/repository/cart_repository.dart'
    as _i28;
import 'package:ecom_app/src/features/cart/domain/usecases/add_new_card_usecase.dart'
    as _i33;
import 'package:ecom_app/src/features/cart/domain/usecases/get_all_cart_products_usecase.dart'
    as _i34;
import 'package:ecom_app/src/features/cart/domain/usecases/make_order_usecase.dart'
    as _i35;
import 'package:ecom_app/src/features/cart/presentation/bloc/cart_bloc.dart'
    as _i47;
import 'package:ecom_app/src/features/favorites/data/data_source/supabase_datasource.dart'
    as _i8;
import 'package:ecom_app/src/features/favorites/data/repository/supabase_repository_impl.dart'
    as _i11;
import 'package:ecom_app/src/features/favorites/domain/repository/favorite_repository.dart'
    as _i10;
import 'package:ecom_app/src/features/favorites/domain/use_case/get_favorite_products_usecase.dart'
    as _i25;
import 'package:ecom_app/src/features/favorites/domain/use_case/get_filtered_items_usecase.dart'
    as _i26;
import 'package:ecom_app/src/features/favorites/presentation/bloc/favorite_bloc.dart'
    as _i30;
import 'package:ecom_app/src/features/home/data/data_source/supabase_datasource.dart'
    as _i9;
import 'package:ecom_app/src/features/home/data/repository/supabase_repository_impl.dart'
    as _i32;
import 'package:ecom_app/src/features/home/domain/repository/home_repository.dart'
    as _i31;
import 'package:ecom_app/src/features/home/domain/usecases/add_last_search_usecase.dart'
    as _i36;
import 'package:ecom_app/src/features/home/domain/usecases/get_all_categories_usecase.dart'
    as _i37;
import 'package:ecom_app/src/features/home/domain/usecases/get_all_products_by_category.dart'
    as _i38;
import 'package:ecom_app/src/features/home/domain/usecases/get_filtered_items_usecase.dart'
    as _i39;
import 'package:ecom_app/src/features/home/domain/usecases/get_last_search_usecase.dart'
    as _i40;
import 'package:ecom_app/src/features/home/domain/usecases/get_new_arrivals_usecase.dart'
    as _i41;
import 'package:ecom_app/src/features/home/domain/usecases/get_search_items_usecase.dart'
    as _i42;
import 'package:ecom_app/src/features/home/presentation/bloc/home_bloc.dart'
    as _i54;
import 'package:ecom_app/src/features/settings/data/data_source/supabase_datasource.dart'
    as _i16;
import 'package:ecom_app/src/features/settings/data/repository/supabase_repository_impl.dart'
    as _i46;
import 'package:ecom_app/src/features/settings/domain/repository/settings_repository.dart'
    as _i45;
import 'package:ecom_app/src/features/settings/domain/use_cases/change_password_usecase.dart'
    as _i52;
import 'package:ecom_app/src/features/settings/domain/use_cases/update_profile_photo_usecase.dart'
    as _i53;
import 'package:ecom_app/src/features/settings/presentation/bloc/settings_bloc.dart'
    as _i55;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
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
    gh.lazySingleton<_i5.FlutterSecureStorage>(
        () => injectionModule.secureStorage);
    gh.lazySingleton<_i6.SharedPreferencesSource>(() =>
        _i6.SharedPreferencesSource(preferences: gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i7.SupabaseCoreRepository>(
        () => _i7.SupabaseCoreRepository(
              supabase: gh<_i4.SupabaseClient>(),
              preferences: gh<_i3.SharedPreferences>(),
            ));
    gh.lazySingleton<_i8.SupabaseFavoritesDatasource>(
        () => _i8.SupabaseFavoritesDatasource(
              supabase: gh<_i4.SupabaseClient>(),
              preferences: gh<_i3.SharedPreferences>(),
            ));
    gh.lazySingleton<_i9.SupabaseHomeDataSource>(
        () => _i9.SupabaseHomeDataSource(
              supabase: gh<_i4.SupabaseClient>(),
              preferences: gh<_i3.SharedPreferences>(),
            ));
    gh.lazySingleton<_i10.FavoriteRepository>(() =>
        _i11.SupabaseFavoritesRepositoryImpl(
            supabaseFavoritesDatasource:
                gh<_i8.SupabaseFavoritesDatasource>()));
    gh.lazySingleton<_i12.EncryptionService>(() =>
        injectionModule.encryptionService(gh<_i5.FlutterSecureStorage>()));
    gh.lazySingleton<_i13.CoreRepository>(() =>
        _i14.SupabaseCoreRepostitoryImpl(
            supabaseCoreRepository: gh<_i7.SupabaseCoreRepository>()));
    gh.lazySingleton<_i15.SupabaseAuthDataSource>(
        () => _i15.SupabaseAuthDataSource(supabase: gh<_i4.SupabaseClient>()));
    gh.lazySingleton<_i16.SupabaseSettingsDatasource>(() =>
        _i16.SupabaseSettingsDatasource(supabase: gh<_i4.SupabaseClient>()));
    gh.factory<_i17.DecrementCountProductUsecase>(() =>
        _i17.DecrementCountProductUsecase(
            coreRepository: gh<_i13.CoreRepository>()));
    gh.factory<_i18.DislikeUsecase>(
        () => _i18.DislikeUsecase(coreRepository: gh<_i13.CoreRepository>()));
    gh.factory<_i19.GetAllShopingCartUsecase>(() =>
        _i19.GetAllShopingCartUsecase(
            coreRepository: gh<_i13.CoreRepository>()));
    gh.factory<_i20.GetCountProductUsecase>(() =>
        _i20.GetCountProductUsecase(coreRepository: gh<_i13.CoreRepository>()));
    gh.factory<_i21.GetProfileUsecase>(() =>
        _i21.GetProfileUsecase(coreRepository: gh<_i13.CoreRepository>()));
    gh.factory<_i22.IncrementCountProductUsecase>(() =>
        _i22.IncrementCountProductUsecase(
            coreRepository: gh<_i13.CoreRepository>()));
    gh.factory<_i23.LikeUseCase>(
        () => _i23.LikeUseCase(coreRepository: gh<_i13.CoreRepository>()));
    gh.factory<_i24.SyncWithDbUsecase>(() =>
        _i24.SyncWithDbUsecase(coreRepository: gh<_i13.CoreRepository>()));
    gh.factory<_i25.GetFavoriteProductsUsecase>(() =>
        _i25.GetFavoriteProductsUsecase(
            homeRepository: gh<_i10.FavoriteRepository>()));
    gh.factory<_i26.GetFilteredItemsUsecase>(() => _i26.GetFilteredItemsUsecase(
        homeRepository: gh<_i10.FavoriteRepository>()));
    gh.lazySingleton<_i27.SupabaseCartDatasource>(
        () => _i27.SupabaseCartDatasource(
              supabase: gh<_i4.SupabaseClient>(),
              preferences: gh<_i3.SharedPreferences>(),
              secureStorage: gh<_i5.FlutterSecureStorage>(),
              encryptionService: gh<_i12.EncryptionService>(),
            ));
    gh.lazySingleton<_i28.CartRepository>(() => _i29.CartRepositoryImpl(
          supabaseCartDatasource: gh<_i27.SupabaseCartDatasource>(),
          encryptionService: gh<_i12.EncryptionService>(),
        ));
    gh.factory<_i30.FavoriteBloc>(() => _i30.FavoriteBloc(
          getFilteredItemsUsecase: gh<_i26.GetFilteredItemsUsecase>(),
          favoriteRepository: gh<_i25.GetFavoriteProductsUsecase>(),
        ));
    gh.lazySingleton<_i31.HomeRepository>(() => _i32.SupabaseRepositoryImpl(
        dataSource: gh<_i9.SupabaseHomeDataSource>()));
    gh.factory<_i33.AddNewCardUsecase>(() =>
        _i33.AddNewCardUsecase(cartRepository: gh<_i28.CartRepository>()));
    gh.factory<_i34.GetAllCartProductsUsecase>(() =>
        _i34.GetAllCartProductsUsecase(
            cartRepository: gh<_i28.CartRepository>()));
    gh.factory<_i35.MakeOrderUsecase>(
        () => _i35.MakeOrderUsecase(cartRepository: gh<_i28.CartRepository>()));
    gh.factory<_i36.AddLastSearchUsecase>(() =>
        _i36.AddLastSearchUsecase(homeRepository: gh<_i31.HomeRepository>()));
    gh.factory<_i37.GetAllCategoriesUsecase>(() => _i37.GetAllCategoriesUsecase(
        homeRepository: gh<_i31.HomeRepository>()));
    gh.factory<_i38.GetAllProductsByCategoryUseCase>(() =>
        _i38.GetAllProductsByCategoryUseCase(
            homeRepository: gh<_i31.HomeRepository>()));
    gh.factory<_i39.GetFilteredItemsUsecase>(() => _i39.GetFilteredItemsUsecase(
        homeRepository: gh<_i31.HomeRepository>()));
    gh.factory<_i40.GetLastSearchUsecase>(() =>
        _i40.GetLastSearchUsecase(homeRepository: gh<_i31.HomeRepository>()));
    gh.factory<_i41.GetNewArrivalsUsecase>(() =>
        _i41.GetNewArrivalsUsecase(homeRepository: gh<_i31.HomeRepository>()));
    gh.factory<_i42.GetSearchItemsUsecase>(() =>
        _i42.GetSearchItemsUsecase(homeRepository: gh<_i31.HomeRepository>()));
    gh.lazySingleton<_i43.AuthRepository>(() => _i44.SupabaseAuthRepositoryImpl(
        supabaseds: gh<_i15.SupabaseAuthDataSource>()));
    gh.lazySingleton<_i45.SettingsRepository>(() => _i46.SupabaseRepositoryImpl(
        dataSource: gh<_i16.SupabaseSettingsDatasource>()));
    gh.factory<_i47.CartBloc>(() => _i47.CartBloc(
          getAllCartProductsUsecase: gh<_i34.GetAllCartProductsUsecase>(),
          addNewCardUsecase: gh<_i33.AddNewCardUsecase>(),
          makeOrderUsecase: gh<_i35.MakeOrderUsecase>(),
        ));
    gh.factory<_i48.CoreBloc>(() => _i48.CoreBloc(
          getAllShopingCartUsecase: gh<_i19.GetAllShopingCartUsecase>(),
          incrementCountProductUsecase: gh<_i22.IncrementCountProductUsecase>(),
          decrementCountProductUsecase: gh<_i17.DecrementCountProductUsecase>(),
          likeUseCase: gh<_i23.LikeUseCase>(),
          dislikeUsecase: gh<_i18.DislikeUsecase>(),
          syncWithDbUsecase: gh<_i24.SyncWithDbUsecase>(),
          getProfileUsecase: gh<_i21.GetProfileUsecase>(),
          addLastSearchUsecase: gh<_i36.AddLastSearchUsecase>(),
          getLastSearchUsecase: gh<_i40.GetLastSearchUsecase>(),
          getSearchItemsUsecase: gh<_i42.GetSearchItemsUsecase>(),
          getCountProductUsecase: gh<_i20.GetCountProductUsecase>(),
        ));
    gh.factory<_i49.EmailVerifUsecase>(() =>
        _i49.EmailVerifUsecase(authRepository: gh<_i43.AuthRepository>()));
    gh.factory<_i50.SigninUsecase>(
        () => _i50.SigninUsecase(authRepository: gh<_i43.AuthRepository>()));
    gh.factory<_i51.SignupUsecase>(
        () => _i51.SignupUsecase(authRepository: gh<_i43.AuthRepository>()));
    gh.factory<_i52.ChangePasswordUsecase>(() => _i52.ChangePasswordUsecase(
        settingsRepository: gh<_i45.SettingsRepository>()));
    gh.factory<_i53.UpdateProfilePhotoUsecase>(() =>
        _i53.UpdateProfilePhotoUsecase(
            settingsRepository: gh<_i45.SettingsRepository>()));
    gh.factory<_i54.HomeBloc>(() => _i54.HomeBloc(
          gh<_i39.GetFilteredItemsUsecase>(),
          productsByCategoryUseCase: gh<_i38.GetAllProductsByCategoryUseCase>(),
          allCategoriesUsecase: gh<_i37.GetAllCategoriesUsecase>(),
          arrivalsUsecase: gh<_i41.GetNewArrivalsUsecase>(),
          getLastSearchUsecase: gh<_i40.GetLastSearchUsecase>(),
          addLastSearchUsecase: gh<_i36.AddLastSearchUsecase>(),
          getSearchItemsUsecase: gh<_i42.GetSearchItemsUsecase>(),
        ));
    gh.factory<_i55.SettingsBloc>(() => _i55.SettingsBloc(
          updateProfilePhotoUsecase: gh<_i53.UpdateProfilePhotoUsecase>(),
          changePasswordUsecase: gh<_i52.ChangePasswordUsecase>(),
        ));
    gh.factory<_i56.AuthBloc>(() => _i56.AuthBloc(
          signinUsecase: gh<_i50.SigninUsecase>(),
          signupUsecase: gh<_i51.SignupUsecase>(),
          emailVerifUsecase: gh<_i49.EmailVerifUsecase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i57.InjectionModule {}
