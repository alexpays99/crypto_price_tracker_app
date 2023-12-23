import 'package:crypto_price_tracker_app/data/repositories/crypto_repository_impl.dart';
import 'package:crypto_price_tracker_app/data/services/crypto_service.dart';
import 'package:crypto_price_tracker_app/domain/repositories/crypto_repository.dart';
import 'package:crypto_price_tracker_app/domain/usecases/get_historical_coin_market_data.dart';
import 'package:crypto_price_tracker_app/domain/usecases/get_most_visited_crypto.dart';
import 'package:crypto_price_tracker_app/presentation/crypto_info_screen/bloc/crypto_info_bloc.dart';
import 'package:crypto_price_tracker_app/presentation/crypto_list_sreen/bloc/crypto_list_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

abstract class InjectionContainer {
  static void initDependencyInjection() async {
    // Side packages
    getIt.registerLazySingleton<Dio>(() => Dio());

    // Services
    getIt.registerLazySingleton<CryptoService>(
        () => CryptoService(dio: getIt.get<Dio>()));

    // Repositories
    getIt.registerLazySingleton<CryptoRepository>(
        () => CryptoRepositoryImpl(cryptoService: getIt.get<CryptoService>()));

    // Usecases
    getIt.registerLazySingleton(() => GetMostVisited(getIt()));
    getIt.registerLazySingleton(() => GetHistoricalCoinMarketData(getIt()));

    // Blocs and Cubits
    getIt.registerLazySingleton(() => CryptoListBloc());
    getIt.registerLazySingleton(() => CryptoInfoBloc());
  }
}
