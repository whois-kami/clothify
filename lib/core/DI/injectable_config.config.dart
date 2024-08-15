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
    as _i15;
import 'package:ecom_app/core/DI/injectable_config.dart' as _i72;
import 'package:ecom_app/core/domain/repostitory/core_repository.dart' as _i14;
import 'package:ecom_app/core/domain/use_cases/decrement_count_product_usecase.dart'
    as _i19;
import 'package:ecom_app/core/domain/use_cases/dislike_usecase.dart' as _i20;
import 'package:ecom_app/core/domain/use_cases/get_all_shoping_cart_usecase.dart'
    as _i21;
import 'package:ecom_app/core/domain/use_cases/get_count_product_usecase.dart'
    as _i22;
import 'package:ecom_app/core/domain/use_cases/get_profile_usecase.dart'
    as _i23;
import 'package:ecom_app/core/domain/use_cases/increment_count_product_usecase.dart'
    as _i24;
import 'package:ecom_app/core/domain/use_cases/like_usecase.dart' as _i25;
import 'package:ecom_app/core/domain/use_cases/sync_with_db_usecase.dart'
    as _i26;
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart' as _i59;
import 'package:ecom_app/core/services/encrypt_decrypt.dart' as _i13;
import 'package:ecom_app/src/features/auth/data/data_source/supabase_datasource.dart'
    as _i16;
import 'package:ecom_app/src/features/auth/data/repositories/supabase_auth_repository.dart'
    as _i53;
import 'package:ecom_app/src/features/auth/domain/repositories/auth_repository.dart'
    as _i52;
import 'package:ecom_app/src/features/auth/domain/usecases/add_user_info_usecase.dart'
    as _i62;
import 'package:ecom_app/src/features/auth/domain/usecases/check_email_verif_usecase.dart'
    as _i63;
import 'package:ecom_app/src/features/auth/domain/usecases/signin_usecase.dart'
    as _i60;
import 'package:ecom_app/src/features/auth/domain/usecases/signup_usecase.dart'
    as _i61;
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_bloc.dart'
    as _i70;
import 'package:ecom_app/src/features/cart/data/data_source/supabase_datasource.dart'
    as _i27;
import 'package:ecom_app/src/features/cart/data/repository/cart_repository_impl.dart'
    as _i33;
import 'package:ecom_app/src/features/cart/domain/repository/cart_repository.dart'
    as _i32;
import 'package:ecom_app/src/features/cart/domain/usecases/add_new_card_usecase.dart'
    as _i38;
import 'package:ecom_app/src/features/cart/domain/usecases/delete_cart_item_usecase.dart'
    as _i39;
import 'package:ecom_app/src/features/cart/domain/usecases/edit_current_card_usecase.dart'
    as _i40;
import 'package:ecom_app/src/features/cart/domain/usecases/get_all_cards_usecase.dart'
    as _i41;
import 'package:ecom_app/src/features/cart/domain/usecases/get_all_cart_products_usecase.dart'
    as _i42;
import 'package:ecom_app/src/features/cart/domain/usecases/make_order_usecase.dart'
    as _i43;
import 'package:ecom_app/src/features/cart/presentation/bloc/cart_bloc.dart'
    as _i69;
import 'package:ecom_app/src/features/favorite/data/data_source/supabase_datasource.dart'
    as _i8;
import 'package:ecom_app/src/features/favorite/data/repository/supabase_repository_impl.dart'
    as _i12;
import 'package:ecom_app/src/features/favorite/domain/repository/favorite_repository.dart'
    as _i11;
import 'package:ecom_app/src/features/favorite/domain/use_case/get_favorite_products_usecase.dart'
    as _i28;
import 'package:ecom_app/src/features/favorite/domain/use_case/get_filtered_items_usecase.dart'
    as _i29;
import 'package:ecom_app/src/features/favorite/presentation/bloc/favorite_bloc.dart'
    as _i44;
import 'package:ecom_app/src/features/home/data/data_source/supabase_datasource.dart'
    as _i9;
import 'package:ecom_app/src/features/home/data/repository/supabase_repository_impl.dart'
    as _i37;
import 'package:ecom_app/src/features/home/domain/repository/home_repository.dart'
    as _i36;
import 'package:ecom_app/src/features/home/domain/usecases/get_all_categories_usecase.dart'
    as _i49;
import 'package:ecom_app/src/features/home/domain/usecases/get_all_products_by_category.dart'
    as _i50;
import 'package:ecom_app/src/features/home/domain/usecases/get_new_arrivals_usecase.dart'
    as _i51;
import 'package:ecom_app/src/features/home/presentation/bloc/home_bloc.dart'
    as _i67;
import 'package:ecom_app/src/features/search/data/data_source/supabase_datasource.dart'
    as _i10;
import 'package:ecom_app/src/features/search/data/repository/supabase_repository_impl.dart'
    as _i31;
import 'package:ecom_app/src/features/search/domain/repository/search_repository.dart'
    as _i30;
import 'package:ecom_app/src/features/search/domain/usecases/add_last_search_usecase.dart'
    as _i45;
import 'package:ecom_app/src/features/search/domain/usecases/get_filtered_items_usecase.dart'
    as _i46;
import 'package:ecom_app/src/features/search/domain/usecases/get_last_search_usecase.dart'
    as _i47;
import 'package:ecom_app/src/features/search/domain/usecases/get_search_items_usecase.dart'
    as _i48;
import 'package:ecom_app/src/features/search/presentation/bloc/search_bloc.dart'
    as _i68;
import 'package:ecom_app/src/features/settings/data/data_source/supabase_datasource.dart'
    as _i17;
import 'package:ecom_app/src/features/settings/data/repository/supabase_repository_impl.dart'
    as _i55;
import 'package:ecom_app/src/features/settings/domain/repository/settings_repository.dart'
    as _i54;
import 'package:ecom_app/src/features/settings/domain/use_cases/change_password_usecase.dart'
    as _i64;
import 'package:ecom_app/src/features/settings/domain/use_cases/logout_usecase.dart'
    as _i65;
import 'package:ecom_app/src/features/settings/domain/use_cases/update_profile_photo_usecase.dart'
    as _i66;
import 'package:ecom_app/src/features/settings/presentation/bloc/settings_bloc.dart'
    as _i71;
import 'package:ecom_app/src/features/tracking/data/data_source/supabase_datasource.dart'
    as _i18;
import 'package:ecom_app/src/features/tracking/data/repository/tracking_repository_impl.dart'
    as _i35;
import 'package:ecom_app/src/features/tracking/domain/repository/tracking_repository.dart'
    as _i34;
import 'package:ecom_app/src/features/tracking/domain/usecases/get_current_orders_usecase.dart'
    as _i56;
import 'package:ecom_app/src/features/tracking/domain/usecases/get_history_orders_usecase.dart'
    as _i57;
import 'package:ecom_app/src/features/tracking/presentation/bloc/tracking_bloc.dart'
    as _i58;
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
    gh.lazySingleton<_i10.SupabaseSearchDatasource>(
        () => _i10.SupabaseSearchDatasource(
              supabase: gh<_i4.SupabaseClient>(),
              preferences: gh<_i3.SharedPreferences>(),
            ));
    gh.lazySingleton<_i11.FavoriteRepository>(() =>
        _i12.SupabaseFavoritesRepositoryImpl(
            supabaseFavoritesDatasource:
                gh<_i8.SupabaseFavoritesDatasource>()));
    gh.lazySingleton<_i13.EncryptionService>(() =>
        injectionModule.encryptionService(gh<_i5.FlutterSecureStorage>()));
    gh.lazySingleton<_i14.CoreRepository>(() =>
        _i15.SupabaseCoreRepostitoryImpl(
            supabaseCoreRepository: gh<_i7.SupabaseCoreRepository>()));
    gh.lazySingleton<_i16.SupabaseAuthDataSource>(
        () => _i16.SupabaseAuthDataSource(supabase: gh<_i4.SupabaseClient>()));
    gh.lazySingleton<_i17.SupabaseSettingsDatasource>(() =>
        _i17.SupabaseSettingsDatasource(supabase: gh<_i4.SupabaseClient>()));
    gh.lazySingleton<_i18.SupabaseTrackingDatasource>(() =>
        _i18.SupabaseTrackingDatasource(supabase: gh<_i4.SupabaseClient>()));
    gh.factory<_i19.DecrementCountProductUsecase>(() =>
        _i19.DecrementCountProductUsecase(
            coreRepository: gh<_i14.CoreRepository>()));
    gh.factory<_i20.DislikeUsecase>(
        () => _i20.DislikeUsecase(coreRepository: gh<_i14.CoreRepository>()));
    gh.factory<_i21.GetAllShopingCartUsecase>(() =>
        _i21.GetAllShopingCartUsecase(
            coreRepository: gh<_i14.CoreRepository>()));
    gh.factory<_i22.GetCountProductUsecase>(() =>
        _i22.GetCountProductUsecase(coreRepository: gh<_i14.CoreRepository>()));
    gh.factory<_i23.GetProfileUsecase>(() =>
        _i23.GetProfileUsecase(coreRepository: gh<_i14.CoreRepository>()));
    gh.factory<_i24.IncrementCountProductUsecase>(() =>
        _i24.IncrementCountProductUsecase(
            coreRepository: gh<_i14.CoreRepository>()));
    gh.factory<_i25.LikeUseCase>(
        () => _i25.LikeUseCase(coreRepository: gh<_i14.CoreRepository>()));
    gh.factory<_i26.SyncWithDbUsecase>(() =>
        _i26.SyncWithDbUsecase(coreRepository: gh<_i14.CoreRepository>()));
    gh.lazySingleton<_i27.SupabaseCartDatasource>(
        () => _i27.SupabaseCartDatasource(
              supabase: gh<_i4.SupabaseClient>(),
              preferences: gh<_i3.SharedPreferences>(),
              secureStorage: gh<_i5.FlutterSecureStorage>(),
              encryptionService: gh<_i13.EncryptionService>(),
            ));
    gh.factory<_i28.GetFavoriteProductsUsecase>(() =>
        _i28.GetFavoriteProductsUsecase(
            homeRepository: gh<_i11.FavoriteRepository>()));
    gh.factory<_i29.GetFilteredItemsUsecase>(() => _i29.GetFilteredItemsUsecase(
        homeRepository: gh<_i11.FavoriteRepository>()));
    gh.lazySingleton<_i30.SearchRepository>(() => _i31.SupabaseRepositoryImpl(
        searchDatasource: gh<_i10.SupabaseSearchDatasource>()));
    gh.lazySingleton<_i32.CartRepository>(() => _i33.CartRepositoryImpl(
          supabaseCartDatasource: gh<_i27.SupabaseCartDatasource>(),
          encryptionService: gh<_i13.EncryptionService>(),
        ));
    gh.lazySingleton<_i34.TrackingRepository>(() => _i35.TrackingRepositoryImpl(
        supabaseTrackingDatasource: gh<_i18.SupabaseTrackingDatasource>()));
    gh.lazySingleton<_i36.HomeRepository>(() => _i37.SupabaseRepositoryImpl(
        dataSource: gh<_i9.SupabaseHomeDataSource>()));
    gh.factory<_i38.AddNewCardUsecase>(() =>
        _i38.AddNewCardUsecase(cartRepository: gh<_i32.CartRepository>()));
    gh.factory<_i39.DeleteCartItemUsecase>(() =>
        _i39.DeleteCartItemUsecase(cartRepository: gh<_i32.CartRepository>()));
    gh.factory<_i40.EditCurrentCardUsecase>(() =>
        _i40.EditCurrentCardUsecase(cartRepository: gh<_i32.CartRepository>()));
    gh.factory<_i41.GetAllCardsUsecase>(() =>
        _i41.GetAllCardsUsecase(cartRepository: gh<_i32.CartRepository>()));
    gh.factory<_i42.GetAllCartProductsUsecase>(() =>
        _i42.GetAllCartProductsUsecase(
            cartRepository: gh<_i32.CartRepository>()));
    gh.factory<_i43.MakeOrderUsecase>(
        () => _i43.MakeOrderUsecase(cartRepository: gh<_i32.CartRepository>()));
    gh.factory<_i44.FavoriteBloc>(() => _i44.FavoriteBloc(
          getFilteredItemsUsecase: gh<_i29.GetFilteredItemsUsecase>(),
          favoriteRepository: gh<_i28.GetFavoriteProductsUsecase>(),
        ));
    gh.factory<_i45.AddLastSearchUsecase>(() => _i45.AddLastSearchUsecase(
        searchRepository: gh<_i30.SearchRepository>()));
    gh.factory<_i46.GetFilteredItemsUsecase>(() => _i46.GetFilteredItemsUsecase(
        searchRepository: gh<_i30.SearchRepository>()));
    gh.factory<_i47.GetLastSearchUsecase>(() => _i47.GetLastSearchUsecase(
        searchRepository: gh<_i30.SearchRepository>()));
    gh.factory<_i48.GetSearchItemsUsecase>(() => _i48.GetSearchItemsUsecase(
        searchRepository: gh<_i30.SearchRepository>()));
    gh.factory<_i49.GetAllCategoriesUsecase>(() => _i49.GetAllCategoriesUsecase(
        homeRepository: gh<_i36.HomeRepository>()));
    gh.factory<_i50.GetAllProductsByCategoryUseCase>(() =>
        _i50.GetAllProductsByCategoryUseCase(
            homeRepository: gh<_i36.HomeRepository>()));
    gh.factory<_i51.GetNewArrivalsUsecase>(() =>
        _i51.GetNewArrivalsUsecase(homeRepository: gh<_i36.HomeRepository>()));
    gh.lazySingleton<_i52.AuthRepository>(() => _i53.SupabaseAuthRepositoryImpl(
        supabaseds: gh<_i16.SupabaseAuthDataSource>()));
    gh.lazySingleton<_i54.SettingsRepository>(() => _i55.SupabaseRepositoryImpl(
        dataSource: gh<_i17.SupabaseSettingsDatasource>()));
    gh.factory<_i56.GetCurrentOrdersUsecase>(() => _i56.GetCurrentOrdersUsecase(
        trackingRepository: gh<_i34.TrackingRepository>()));
    gh.factory<_i57.GetHistoryOrdersUsecase>(() => _i57.GetHistoryOrdersUsecase(
        trackingRepository: gh<_i34.TrackingRepository>()));
    gh.factory<_i58.TrackingBloc>(() => _i58.TrackingBloc(
          getCurrentOrdersUsecase: gh<_i56.GetCurrentOrdersUsecase>(),
          getHistoryOrdersUsecase: gh<_i57.GetHistoryOrdersUsecase>(),
        ));
    gh.factory<_i59.CoreBloc>(() => _i59.CoreBloc(
          getAllShopingCartUsecase: gh<_i21.GetAllShopingCartUsecase>(),
          incrementCountProductUsecase: gh<_i24.IncrementCountProductUsecase>(),
          decrementCountProductUsecase: gh<_i19.DecrementCountProductUsecase>(),
          likeUseCase: gh<_i25.LikeUseCase>(),
          dislikeUsecase: gh<_i20.DislikeUsecase>(),
          syncWithDbUsecase: gh<_i26.SyncWithDbUsecase>(),
          getProfileUsecase: gh<_i23.GetProfileUsecase>(),
          addLastSearchUsecase: gh<_i45.AddLastSearchUsecase>(),
          getLastSearchUsecase: gh<_i47.GetLastSearchUsecase>(),
          getSearchItemsUsecase: gh<_i48.GetSearchItemsUsecase>(),
          getCountProductUsecase: gh<_i22.GetCountProductUsecase>(),
        ));
    gh.factory<_i60.SigninUsecase>(
        () => _i60.SigninUsecase(authRepository: gh<_i52.AuthRepository>()));
    gh.factory<_i61.SignupUsecase>(
        () => _i61.SignupUsecase(authRepository: gh<_i52.AuthRepository>()));
    gh.factory<_i62.AddUserInfoUsecase>(() =>
        _i62.AddUserInfoUsecase(authRepository: gh<_i52.AuthRepository>()));
    gh.factory<_i63.CheckEmailVerifUseCase>(() =>
        _i63.CheckEmailVerifUseCase(authRepository: gh<_i52.AuthRepository>()));
    gh.factory<_i64.ChangePasswordUsecase>(() => _i64.ChangePasswordUsecase(
        settingsRepository: gh<_i54.SettingsRepository>()));
    gh.factory<_i65.LogoutUsecase>(() =>
        _i65.LogoutUsecase(settingsRepository: gh<_i54.SettingsRepository>()));
    gh.factory<_i66.UpdateProfilePhotoUsecase>(() =>
        _i66.UpdateProfilePhotoUsecase(
            settingsRepository: gh<_i54.SettingsRepository>()));
    gh.factory<_i67.HomeBloc>(() => _i67.HomeBloc(
          productsByCategoryUseCase: gh<_i50.GetAllProductsByCategoryUseCase>(),
          allCategoriesUsecase: gh<_i49.GetAllCategoriesUsecase>(),
          arrivalsUsecase: gh<_i51.GetNewArrivalsUsecase>(),
        ));
    gh.factory<_i68.SearchBloc>(() => _i68.SearchBloc(
          getLastSearchUsecase: gh<_i47.GetLastSearchUsecase>(),
          addLastSearchUsecase: gh<_i45.AddLastSearchUsecase>(),
          getSearchItemsUsecase: gh<_i48.GetSearchItemsUsecase>(),
          getFilteredItemsUsecase: gh<_i46.GetFilteredItemsUsecase>(),
        ));
    gh.factory<_i69.CartBloc>(() => _i69.CartBloc(
          getAllCartProductsUsecase: gh<_i42.GetAllCartProductsUsecase>(),
          addNewCardUsecase: gh<_i38.AddNewCardUsecase>(),
          makeOrderUsecase: gh<_i43.MakeOrderUsecase>(),
          getAllCardsUsecase: gh<_i41.GetAllCardsUsecase>(),
          editCurrentCardUsecase: gh<_i40.EditCurrentCardUsecase>(),
          deleteCartItemUsecase: gh<_i39.DeleteCartItemUsecase>(),
        ));
    gh.factory<_i70.AuthBloc>(() => _i70.AuthBloc(
          signinUsecase: gh<_i60.SigninUsecase>(),
          signupUsecase: gh<_i61.SignupUsecase>(),
          addUserInfoUsecase: gh<_i62.AddUserInfoUsecase>(),
          checkEmailVerifUseCase: gh<_i63.CheckEmailVerifUseCase>(),
        ));
    gh.factory<_i71.SettingsBloc>(() => _i71.SettingsBloc(
          updateProfilePhotoUsecase: gh<_i66.UpdateProfilePhotoUsecase>(),
          changePasswordUsecase: gh<_i64.ChangePasswordUsecase>(),
          logoutUsecase: gh<_i65.LogoutUsecase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i72.InjectionModule {}
