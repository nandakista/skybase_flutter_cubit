/* Created by
   Varcant
   nanda.kista@gmail.com
*/

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skybase/data/sources/local/cache_manager.dart';
import 'package:skybase/core/localization/locale_manager.dart';
import 'package:skybase/data/repositories/auth/auth_repository.dart';
import 'package:skybase/data/repositories/auth/auth_repository_impl.dart';
import 'package:skybase/data/repositories/sample_feature/sample_feature_repository_impl.dart';
import 'package:skybase/data/sources/server/auth/auth_sources.dart';
import 'package:skybase/data/sources/server/auth/auth_sources_impl.dart';
import 'package:skybase/data/sources/server/sample_feature/sample_feature_sources.dart';
import 'package:skybase/ui/views/login/login_cubit.dart';
import 'package:skybase/ui/views/profile/component/repository/profile_repository_cubit.dart';
import 'package:skybase/ui/views/profile/profile_cubit.dart';
import 'package:skybase/ui/views/sample_feature/detail/sample_feature_detail_cubit.dart';
import 'package:skybase/ui/views/sample_feature/list/sample_feature_list_cubit.dart';
import 'package:skybase/ui/views/settings/setting_cubit.dart';

import 'config/auth_manager/auth_manager.dart';
import 'config/network/api_config.dart';
import 'config/themes/theme_manager.dart';
import 'config/app/app_info.dart';
import 'core/database/storage/storage_manager.dart';
import 'core/database/secure_storage/secure_storage_manager.dart';
import 'data/repositories/sample_feature/sample_feature_repository.dart';
import 'data/sources/server/sample_feature/sample_feature_sources_impl.dart';
import 'ui/routes/navigator/app_navigator.dart';
import 'ui/routes/app_routes.dart';
import 'ui/routes/navigator/go_router_navigator.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static Future<void> init() async {
    if (kReleaseMode) debugPrint = (String? message, {int? wrapWidth}) {};
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await AppInfo.init();

    // _initConfig
    sl.registerSingleton(const FlutterSecureStorage());
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton(() => DioClient());
    sl.registerSingleton<SharedPreferences>(sharedPreferences);

    // _initService
    sl.registerLazySingleton(() => SecureStorageManager());
    sl.registerLazySingleton(() => StorageManager());
    sl.registerLazySingleton(() => LocaleManager());
    sl.registerLazySingleton(() => ThemeManager());
    sl.registerLazySingleton(() => CacheManager());
    sl.registerSingleton(AuthManager());
    sl.registerLazySingleton<AppNavigator>(
      () => GoRouterNavigator(AppRoutes.router),
    );

    // Repository
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(apiService: sl<AuthSources>()),
    );
    sl.registerLazySingleton<SampleFeatureRepository>(
      () => SampleFeatureRepositoryImpl(
        apiService: sl<SampleFeatureSources>(),
        cacheManager: sl<CacheManager>(),
      ),
    );

    // Sources
    sl.registerLazySingleton<AuthSources>(() => AuthSourcesImpl());
    sl.registerLazySingleton<SampleFeatureSources>(
      () => SampleFeatureSourcesImpl(),
    );

    // Provider
    sl.registerFactory(() => LoginCubit(sl<AuthRepository>()));
    sl.registerFactory(() => ProfileCubit(sl<AuthRepository>()));
    sl.registerFactory(() => SettingCubit());
    sl.registerFactory(() => ProfileRepositoryCubit(sl<AuthRepository>()));
    sl.registerFactory(
      () => SampleFeatureListCubit(sl<SampleFeatureRepository>()),
    );
    sl.registerFactory(
      () => SampleFeatureDetailCubit(sl<SampleFeatureRepository>()),
    );
  }
}
