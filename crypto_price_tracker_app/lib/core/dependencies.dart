import 'package:crypto_price_tracker_app/presentation/crypto_list_sreen/bloc/crypto_list_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

abstract class InjectionContainer {
  static void initDependencyInjection() async {
    // Blocs and Cubits
    getIt.registerLazySingleton(() => CryptoListBloc());
  }
}
