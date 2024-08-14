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
import 'package:ecom_app/core/DI/injectable_config.dart' as _i68;
import 'package:ecom_app/core/domain/repostitory/core_repository.dart' as _i13;
import 'package:ecom_app/core/domain/use_cases/decrement_count_product_usecase.dart'
    as _i18;
import 'package:ecom_app/core/domain/use_cases/dislike_usecase.dart' as _i19;
import 'package:ecom_app/core/domain/use_cases/get_all_shoping_cart_usecase.dart'
    as _i20;
import 'package:ecom_app/core/domain/use_cases/get_count_product_usecase.dart'
    as _i21;
import 'package:ecom_app/core/domain/use_cases/get_profile_usecase.dart'
    as _i22;
import 'package:ecom_app/core/domain/use_cases/increment_count_product_usecase.dart'
    as _i23;
import 'package:ecom_app/core/domain/use_cases/like_usecase.dart' as _i24;
import 'package:ecom_app/core/domain/use_cases/sync_with_db_usecase.dart'
    as _i25;
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart' as _i56;
import 'package:ecom_app/core/services/encrypt_decrypt.dart' as _i12;
import 'package:ecom_app/src/features/auth/data/data_source/supabase_datasource.dart'
    as _i15;
import 'package:ecom_app/src/features/auth/data/repositories/supabase_auth_repository.dart'
    as _i50;
import 'package:ecom_app/src/features/auth/domain/repositories/auth_repository.dart'
    as _i49;
import 'package:ecom_app/src/features/auth/domain/usecases/add_user_info_usecase.dart'
    as _i59;
import 'package:ecom_app/src/features/auth/domain/usecases/check_email_verif_usecase.dart'
    as _i60;
import 'package:ecom_app/src/features/auth/domain/usecases/signin_usecase.dart'
    as _i57;
import 'package:ecom_app/src/features/auth/domain/usecases/signup_usecase.dart'
    as _i58;
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_bloc.dart'
    as _i66;
import 'package:ecom_app/src/features/cart/data/data_source/supabase_datasource.dart'
    as _i26;
import 'package:ecom_app/src/features/cart/data/repository/cart_repository_impl.dart'
    as _i30;
import 'package:ecom_app/src/features/cart/domain/repository/cart_repository.dart'
    as _i29;
import 'package:ecom_app/src/features/cart/domain/usecases/add_new_card_usecase.dart'
    as _i35;
import 'package:ecom_app/src/features/cart/domain/usecases/delete_cart_item_usecase.dart'
    as _i36;
import 'package:ecom_app/src/features/cart/domain/usecases/edit_current_card_usecase.dart'
    as _i37;
import 'package:ecom_app/src/features/cart/domain/usecases/get_all_cards_usecase.dart'
    as _i38;
import 'package:ecom_app/src/features/cart/domain/usecases/get_all_cart_products_usecase.dart'
    as _i39;
import 'package:ecom_app/src/features/cart/domain/usecases/make_order_usecase.dart'
    as _i40;
import 'package:ecom_app/src/features/cart/presentation/bloc/cart_bloc.dart'
    as _i64;
import 'package:ecom_app/src/features/favorite/data/data_source/supabase_datasource.dart'
    as _i8;
import 'package:ecom_app/src/features/favorite/data/repository/supabase_repository_impl.dart'
    as _i11;
import 'package:ecom_app/src/features/favorite/domain/repository/favorite_repository.dart'
    as _i10;
import 'package:ecom_app/src/features/favorite/domain/use_case/get_favorite_products_usecase.dart'
    as _i27;
import 'package:ecom_app/src/features/favorite/domain/use_case/get_filtered_items_usecase.dart'
    as _i28;
import 'package:ecom_app/src/features/favorite/presentation/bloc/favorite_bloc.dart'
    as _i41;
import 'package:ecom_app/src/features/home/data/data_source/supabase_datasource.dart'
    as _i9;
import 'package:ecom_app/src/features/home/data/repository/supabase_repository_impl.dart'
    as _i34;
import 'package:ecom_app/src/features/home/domain/repository/home_repository.dart'
    as _i33;
import 'package:ecom_app/src/features/home/domain/usecases/add_last_search_usecase.dart'
    as _i42;
import 'package:ecom_app/src/features/home/domain/usecases/get_all_categories_usecase.dart'
    as _i43;
import 'package:ecom_app/src/features/home/domain/usecases/get_all_products_by_category.dart'
    as _i44;
import 'package:ecom_app/src/features/home/domain/usecases/get_filtered_items_usecase.dart'
    as _i45;
import 'package:ecom_app/src/features/home/domain/usecases/get_last_search_usecase.dart'
    as _i46;
import 'package:ecom_app/src/features/home/domain/usecases/get_new_arrivals_usecase.dart'
    as _i47;
import 'package:ecom_app/src/features/home/domain/usecases/get_search_items_usecase.dart'
    as _i48;
import 'package:ecom_app/src/features/home/presentation/bloc/home_bloc.dart'
    as _i65;
import 'package:ecom_app/src/features/settings/data/data_source/supabase_datasource.dart'
    as _i16;
import 'package:ecom_app/src/features/settings/data/repository/supabase_repository_impl.dart'
    as _i52;
import 'package:ecom_app/src/features/settings/domain/repository/settings_repository.dart'
    as _i51;
import 'package:ecom_app/src/features/settings/domain/use_cases/change_password_usecase.dart'
    as _i61;
import 'package:ecom_app/src/features/settings/domain/use_cases/logout_usecase.dart'
    as _i62;
import 'package:ecom_app/src/features/settings/domain/use_cases/update_profile_photo_usecase.dart'
    as _i63;
import 'package:ecom_app/src/features/settings/presentation/bloc/settings_bloc.dart'
    as _i67;
import 'package:ecom_app/src/features/tracking/data/data_source/supabase_datasource.dart'
    as _i17;
import 'package:ecom_app/src/features/tracking/data/repository/tracking_repository_impl.dart'
    as _i32;
import 'package:ecom_app/src/features/tracking/domain/repository/tracking_repository.dart'
    as _i31;
import 'package:ecom_app/src/features/tracking/domain/usecases/get_current_orders_usecase.dart'
    as _i53;
import 'package:ecom_app/src/features/tracking/domain/usecases/get_history_orders_usecase.dart'
    as _i54;
import 'package:ecom_app/src/features/tracking/presentation/bloc/tracking_bloc.dart'
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
    gh.lazySingleton<_i17.SupabaseTrackingDatasource>(() =>
        _i17.SupabaseTrackingDatasource(supabase: gh<_i4.SupabaseClient>()));
    gh.factory<_i18.DecrementCountProductUsecase>(() =>
        _i18.DecrementCountProductUsecase(
            coreRepository: gh<_i13.CoreRepository>()));
    gh.factory<_i19.DislikeUsecase>(
        () => _i19.DislikeUsecase(coreRepository: gh<_i13.CoreRepository>()));
    gh.factory<_i20.GetAllShopingCartUsecase>(() =>
        _i20.GetAllShopingCartUsecase(
            coreRepository: gh<_i13.CoreRepository>()));
    gh.factory<_i21.GetCountProductUsecase>(() =>
        _i21.GetCountProductUsecase(coreRepository: gh<_i13.CoreRepository>()));
    gh.factory<_i22.GetProfileUsecase>(() =>
        _i22.GetProfileUsecase(coreRepository: gh<_i13.CoreRepository>()));
    gh.factory<_i23.IncrementCountProductUsecase>(() =>
        _i23.IncrementCountProductUsecase(
            coreRepository: gh<_i13.CoreRepository>()));
    gh.factory<_i24.LikeUseCase>(
        () => _i24.LikeUseCase(coreRepository: gh<_i13.CoreRepository>()));
    gh.factory<_i25.SyncWithDbUsecase>(() =>
        _i25.SyncWithDbUsecase(coreRepository: gh<_i13.CoreRepository>()));
    gh.lazySingleton<_i26.SupabaseCartDatasource>(
        () => _i26.SupabaseCartDatasource(
              supabase: gh<_i4.SupabaseClient>(),
              preferences: gh<_i3.SharedPreferences>(),
              secureStorage: gh<_i5.FlutterSecureStorage>(),
              encryptionService: gh<_i12.EncryptionService>(),
            ));
    gh.factory<_i27.GetFavoriteProductsUsecase>(() =>
        _i27.GetFavoriteProductsUsecase(
            homeRepository: gh<_i10.FavoriteRepository>()));
    gh.factory<_i28.GetFilteredItemsUsecase>(() => _i28.GetFilteredItemsUsecase(
        homeRepository: gh<_i10.FavoriteRepository>()));
    gh.lazySingleton<_i29.CartRepository>(() => _i30.CartRepositoryImpl(
          supabaseCartDatasource: gh<_i26.SupabaseCartDatasource>(),
          encryptionService: gh<_i12.EncryptionService>(),
        ));
    gh.lazySingleton<_i31.TrackingRepository>(() => _i32.TrackingRepositoryImpl(
        supabaseTrackingDatasource: gh<_i17.SupabaseTrackingDatasource>()));
    gh.lazySingleton<_i33.HomeRepository>(() => _i34.SupabaseRepositoryImpl(
        dataSource: gh<_i9.SupabaseHomeDataSource>()));
    gh.factory<_i35.AddNewCardUsecase>(() =>
        _i35.AddNewCardUsecase(cartRepository: gh<_i29.CartRepository>()));
    gh.factory<_i36.DeleteCartItemUsecase>(() =>
        _i36.DeleteCartItemUsecase(cartRepository: gh<_i29.CartRepository>()));
    gh.factory<_i37.EditCurrentCardUsecase>(() =>
        _i37.EditCurrentCardUsecase(cartRepository: gh<_i29.CartRepository>()));
    gh.factory<_i38.GetAllCardsUsecase>(() =>
        _i38.GetAllCardsUsecase(cartRepository: gh<_i29.CartRepository>()));
    gh.factory<_i39.GetAllCartProductsUsecase>(() =>
        _i39.GetAllCartProductsUsecase(
            cartRepository: gh<_i29.CartRepository>()));
    gh.factory<_i40.MakeOrderUsecase>(
        () => _i40.MakeOrderUsecase(cartRepository: gh<_i29.CartRepository>()));
    gh.factory<_i41.FavoriteBloc>(() => _i41.FavoriteBloc(
          getFilteredItemsUsecase: gh<_i28.GetFilteredItemsUsecase>(),
          favoriteRepository: gh<_i27.GetFavoriteProductsUsecase>(),
        ));
    gh.factory<_i42.AddLastSearchUsecase>(() =>
        _i42.AddLastSearchUsecase(homeRepository: gh<_i33.HomeRepository>()));
    gh.factory<_i43.GetAllCategoriesUsecase>(() => _i43.GetAllCategoriesUsecase(
        homeRepository: gh<_i33.HomeRepository>()));
    gh.factory<_i44.GetAllProductsByCategoryUseCase>(() =>
        _i44.GetAllProductsByCategoryUseCase(
            homeRepository: gh<_i33.HomeRepository>()));
    gh.factory<_i45.GetFilteredItemsUsecase>(() => _i45.GetFilteredItemsUsecase(
        homeRepository: gh<_i33.HomeRepository>()));
    gh.factory<_i46.GetLastSearchUsecase>(() =>
        _i46.GetLastSearchUsecase(homeRepository: gh<_i33.HomeRepository>()));
    gh.factory<_i47.GetNewArrivalsUsecase>(() =>
        _i47.GetNewArrivalsUsecase(homeRepository: gh<_i33.HomeRepository>()));
    gh.factory<_i48.GetSearchItemsUsecase>(() =>
        _i48.GetSearchItemsUsecase(homeRepository: gh<_i33.HomeRepository>()));
    gh.lazySingleton<_i49.AuthRepository>(() => _i50.SupabaseAuthRepositoryImpl(
        supabaseds: gh<_i15.SupabaseAuthDataSource>()));
    gh.lazySingleton<_i51.SettingsRepository>(() => _i52.SupabaseRepositoryImpl(
        dataSource: gh<_i16.SupabaseSettingsDatasource>()));
    gh.factory<_i53.GetCurrentOrdersUsecase>(() => _i53.GetCurrentOrdersUsecase(
        trackingRepository: gh<_i31.TrackingRepository>()));
    gh.factory<_i54.GetHistoryOrdersUsecase>(() => _i54.GetHistoryOrdersUsecase(
        trackingRepository: gh<_i31.TrackingRepository>()));
    gh.factory<_i55.TrackingBloc>(() => _i55.TrackingBloc(
          getCurrentOrdersUsecase: gh<_i53.GetCurrentOrdersUsecase>(),
          getHistoryOrdersUsecase: gh<_i54.GetHistoryOrdersUsecase>(),
        ));
    gh.factory<_i56.CoreBloc>(() => _i56.CoreBloc(
          getAllShopingCartUsecase: gh<_i20.GetAllShopingCartUsecase>(),
          incrementCountProductUsecase: gh<_i23.IncrementCountProductUsecase>(),
          decrementCountProductUsecase: gh<_i18.DecrementCountProductUsecase>(),
          likeUseCase: gh<_i24.LikeUseCase>(),
          dislikeUsecase: gh<_i19.DislikeUsecase>(),
          syncWithDbUsecase: gh<_i25.SyncWithDbUsecase>(),
          getProfileUsecase: gh<_i22.GetProfileUsecase>(),
          addLastSearchUsecase: gh<_i42.AddLastSearchUsecase>(),
          getLastSearchUsecase: gh<_i46.GetLastSearchUsecase>(),
          getSearchItemsUsecase: gh<_i48.GetSearchItemsUsecase>(),
          getCountProductUsecase: gh<_i21.GetCountProductUsecase>(),
        ));
    gh.factory<_i57.SigninUsecase>(
        () => _i57.SigninUsecase(authRepository: gh<_i49.AuthRepository>()));
    gh.factory<_i58.SignupUsecase>(
        () => _i58.SignupUsecase(authRepository: gh<_i49.AuthRepository>()));
    gh.factory<_i59.AddUserInfoUsecase>(() =>
        _i59.AddUserInfoUsecase(authRepository: gh<_i49.AuthRepository>()));
    gh.factory<_i60.CheckEmailVerifUseCase>(() =>
        _i60.CheckEmailVerifUseCase(authRepository: gh<_i49.AuthRepository>()));
    gh.factory<_i61.ChangePasswordUsecase>(() => _i61.ChangePasswordUsecase(
        settingsRepository: gh<_i51.SettingsRepository>()));
    gh.factory<_i62.LogoutUsecase>(() =>
        _i62.LogoutUsecase(settingsRepository: gh<_i51.SettingsRepository>()));
    gh.factory<_i63.UpdateProfilePhotoUsecase>(() =>
        _i63.UpdateProfilePhotoUsecase(
            settingsRepository: gh<_i51.SettingsRepository>()));
    gh.factory<_i64.CartBloc>(() => _i64.CartBloc(
          getAllCartProductsUsecase: gh<_i39.GetAllCartProductsUsecase>(),
          addNewCardUsecase: gh<_i35.AddNewCardUsecase>(),
          makeOrderUsecase: gh<_i40.MakeOrderUsecase>(),
          getAllCardsUsecase: gh<_i38.GetAllCardsUsecase>(),
          editCurrentCardUsecase: gh<_i37.EditCurrentCardUsecase>(),
          deleteCartItemUsecase: gh<_i36.DeleteCartItemUsecase>(),
        ));
    gh.factory<_i65.HomeBloc>(() => _i65.HomeBloc(
          gh<_i45.GetFilteredItemsUsecase>(),
          productsByCategoryUseCase: gh<_i44.GetAllProductsByCategoryUseCase>(),
          allCategoriesUsecase: gh<_i43.GetAllCategoriesUsecase>(),
          arrivalsUsecase: gh<_i47.GetNewArrivalsUsecase>(),
          getLastSearchUsecase: gh<_i46.GetLastSearchUsecase>(),
          addLastSearchUsecase: gh<_i42.AddLastSearchUsecase>(),
          getSearchItemsUsecase: gh<_i48.GetSearchItemsUsecase>(),
        ));
    gh.factory<_i66.AuthBloc>(() => _i66.AuthBloc(
          signinUsecase: gh<_i57.SigninUsecase>(),
          signupUsecase: gh<_i58.SignupUsecase>(),
          addUserInfoUsecase: gh<_i59.AddUserInfoUsecase>(),
          checkEmailVerifUseCase: gh<_i60.CheckEmailVerifUseCase>(),
        ));
    gh.factory<_i67.SettingsBloc>(() => _i67.SettingsBloc(
          updateProfilePhotoUsecase: gh<_i63.UpdateProfilePhotoUsecase>(),
          changePasswordUsecase: gh<_i61.ChangePasswordUsecase>(),
          logoutUsecase: gh<_i62.LogoutUsecase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i68.InjectionModule {}
