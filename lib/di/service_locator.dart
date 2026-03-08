import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:metro_buddy/data/base_api_services.dart';
import 'package:metro_buddy/data/network_api_service.dart';
import 'package:metro_buddy/providers/metro_provider.dart';
import 'package:metro_buddy/repository/repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);

  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(BaseOptions(connectTimeout: const Duration(minutes: 1), receiveTimeout: const Duration(minutes: 1)));
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );
    return dio;
  });

  getIt.registerLazySingleton<BaseApiServices>(() => NetworkApiService(getIt<Dio>()));

  getIt.registerLazySingleton<AppRepository>(() => AppRepository(apiServices: getIt<BaseApiServices>()));

  getIt.registerLazySingleton<MetroProvider>(() => MetroProvider(getIt<AppRepository>()));
}
