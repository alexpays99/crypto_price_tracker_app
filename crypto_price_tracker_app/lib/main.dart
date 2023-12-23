import 'package:crypto_price_tracker_app/presentation/crypto_info_screen/bloc/crypto_info_bloc.dart';
import 'package:crypto_price_tracker_app/presentation/crypto_list_sreen/bloc/crypto_list_bloc.dart';
import 'package:crypto_price_tracker_app/presentation/crypto_list_sreen/crypto_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_price_tracker_app/core/dependencies.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.InjectionContainer.initDependencyInjection();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CryptoListBloc>(
          create: (BuildContext context) => di.getIt<CryptoListBloc>()
            ..add(const CryptoListEvent.getMostVisited()),
        ),
        BlocProvider<CryptoInfoBloc>(
          create: (BuildContext context) => di.getIt<CryptoInfoBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CryptoListScreen(title: 'Cryptfo Monitor'),
    );
  }
}
